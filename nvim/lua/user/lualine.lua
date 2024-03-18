local M = {
  "nvim-lualine/lualine.nvim",
}

Truncate_path = false

function M.toggle_truncate()
  Truncate_path = not Truncate_path
  if Truncate_path then
    vim.notify "Harpoon tab bar path truncation enabled"
  else
    vim.notify "Harpoon tab bar path truncation disabled"
  end
end

function M.config()
  vim.keymap.set("n", "<leader>ut", M.toggle_truncate, { desc = "Toggle tabline harpoon path truncation" })

  vim.cmd "highlight HarpoonNumberActive guifg=#FF9E3B"
  vim.cmd "highlight HarpoonActive guifg=#FF9E3B"
  -- vim.cmd "highlight HarpoonNumberInactive guifg=#FF00FF"
  -- vim.cmd "highlight HarpoonInactive guifg=#0000FF"

  function Harpoon_files()
    local harpoon = require "harpoon"
    local contents = {}
    local marks_length = harpoon:list():length()
    local current_file_path = vim.fn.fnamemodify(vim.fn.expand "%:p", ":.")
    local ft = vim.bo.filetype
    -- do not show line if no harpoons, if only 1 tab or if we are on dadshboard
    if --[[ ft == "dashboard" or  ]](marks_length == 0 and #vim.fn.gettabinfo() == 1) then
      vim.cmd":set showtabline=0"
    else
      vim.cmd":set showtabline=2"
    end
    for index = 1, marks_length do
      local harpoon_file_path = harpoon:list():get(index).value
      local file_name = harpoon_file_path == "" and "(empty)" or vim.fn.fnamemodify(harpoon_file_path, ":t")

      if Truncate_path then
        -- logic to add parth with single characters for file names
        local parts = vim.split(harpoon_file_path, "[\\/]")
        local truncated_parts = {}
        -- if #parts > 3 then
        for _, part in pairs(parts) do
          if --[[ _ ~= 1 and ]] -- don't truncate root dir
            _ ~= #parts
            --[[ and _ ~= #parts -1  ]] -- don't truncate parent dir
          then
            part = string.sub(part, 1, 1)
          end
          table.insert(truncated_parts, part)
        end
        -- end
        local sep = "/"
        file_name = table.concat(truncated_parts, sep)
      end

      if current_file_path == harpoon_file_path then
        contents[index] = string.format("%%#HarpoonNumberActive# %s. %%#HarpoonActive#%s ", index, file_name)
      else
        contents[index] = string.format("%%#HarpoonNumberInactive# %s. %%#HarpoonInactive#%s ", index, file_name)
      end
    end
    return table.concat(contents)
  end

  function Grapple_marks()
    local grapple = require "grapple"
    local contents = {}
    local tags = grapple:tags()
    local tags_length = #tags
    -- vim.notify(vim.inspect(grapple:tags()))
    -- path is the relevent key
    local current_file_path = vim.fn.fnamemodify(vim.fn.expand "%:p", ":.")
    local ft = vim.bo.filetype
    -- do not show line if no harpoons, if only 1 tab or if we are on dadshboard
    if --[[ ft == "dashboard" or  ]]
      tags_length == 0 and #vim.fn.gettabinfo() == 1
    then
      vim.cmd ":set showtabline=0"
    else
      vim.cmd ":set showtabline=2"
    end
    for index = 1, tags_length do
      local grapple_file_path = tags[index].path
      local Path = require "plenary.path"
      local relpath = Path:new(grapple_file_path):make_relative(vim.loop.cwd())

      local file_name = relpath == "" and "(empty)" or vim.fn.fnamemodify(grapple_file_path, ":t")

      if Truncate_path then
        -- logic to add parth with single characters for file names
        local parts = vim.split(relpath, "[\\/]")
        local truncated_parts = {}
        -- if #parts > 3 then
        for _, part in pairs(parts) do
          if --[[ _ ~= 1 and ]] -- don't truncate root dir
            _ ~= #parts
            --[[ and _ ~= #parts -1  ]]
            -- don't truncate parent dir
          then
            part = string.sub(part, 1, 1)
          end
          table.insert(truncated_parts, part)
        end
        -- end
        local sep = "/"
        file_name = table.concat(truncated_parts, sep)
      end

      if current_file_path == relpath then
        contents[index] = string.format("%%#HarpoonNumberActive# %s. %%#HarpoonActive#%s ", index, file_name)
      else
        contents[index] = string.format("%%#HarpoonNumberInactive# %s. %%#HarpoonInactive#%s ", index, file_name)
      end
    end
    return table.concat(contents)
  end
  local icons = require "user.resources.icons"
  require("lualine").setup {
    tabline = {
      lualine_z = {
        {
          "tabs",

          -- tab_max_length = 500, -- Maximum width of each tab. The content will be shorten dynamically (example: apple/orange -> a/orange)
          max_length = 1000,
          mode = 2,
          -- path = 1,
          -- cond = function()
          --   return #vim.fn.gettabinfo() > 1
          -- end,
          -- tabs_color = {
          --   -- Same values as the general color option can be used here.
          --   active = "lualine_{section}_normal", -- Color for active tab.
          --   inactive = "lualine_{section}_inactive", -- Color for inactive tab.
          -- },
        },
      },
      lualine_b = {
        -- Harpoon_files,
        Grapple_marks,
      },
    },
    options = {
      section_separators = { left = "", right = "" },
      component_separators = "|",
      ignore_focus = { "Neotree" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },

      lualine_c = {
        {
          "diagnostics",
          symbols = {
            error = icons.diagnostics.BoldError,
            warn = icons.diagnostics.BoldWarning,
            info = icons.diagnostics.BoldInformation,
            hint = icons.diagnostics.BoldHint,
          },
        },
        { "filename", file_status = true, path = 1 },
      },
      lualine_x = {
        { "filetype" },
        {
          "diff",
          symbols = {
            added = icons.git.LineAdded,
            modified = icons.git.LineModified,
            removed = icons.git.LineRemoved,
          },
          source = function()
            local gitsigns = vim.b.gitsigns_status_dict
            if gitsigns then
              return {
                added = gitsigns.added,
                modified = gitsigns.changed,
                removed = gitsigns.removed,
              }
            end
          end,
        },
      },
    },
    -- extensions = { "quickfix", "man", "fugitive" },
  }
end

return M
