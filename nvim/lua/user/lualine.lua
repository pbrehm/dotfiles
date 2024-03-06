local M = {
  "nvim-lualine/lualine.nvim",
}

function M.config()

  vim.cmd "highlight HarpoonNumberActive guifg=#FF9E3B"
  vim.cmd "highlight HarpoonActive guifg=#FF9E3B"
  -- vim.cmd "highlight HarpoonNumberInactive guifg=#FF00FF"
  -- vim.cmd "highlight HarpoonInactive guifg=#0000FF"

  local harpoon = require "harpoon"
  function Harpoon_files()
    local contents = {}
    local marks_length = harpoon:list():length()
    local current_file_path = vim.fn.fnamemodify(vim.fn.expand "%:p", ":.")
    for index = 1, marks_length do
      local harpoon_file_path = harpoon:list():get(index).value
      local file_name = harpoon_file_path == "" and "(empty)" or vim.fn.fnamemodify(harpoon_file_path, ":t")

      if current_file_path == harpoon_file_path then
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
          -- max_length = 1000,
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
        Harpoon_files,
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
