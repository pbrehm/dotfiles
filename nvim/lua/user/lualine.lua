local M = {
  "nvim-lualine/lualine.nvim",
}

function M.config()
  local icons = require "user.resources.icons"
  require("lualine").setup {
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
        { 'filename' }
      },
      lualine_x = {
        { 'file' },
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
        } }
    },
    -- extensions = { "quickfix", "man", "fugitive" },
  }

  -- TODO: lazyvim lualine has git signs in it
end

return M
