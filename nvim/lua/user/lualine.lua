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
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
        },
        { 'filename' }
      },
    },
    -- extensions = { "quickfix", "man", "fugitive" },
  }
end

return M
