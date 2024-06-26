local M = {
  "rebelot/kanagawa.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
}

function M.config()
  require("kanagawa").setup {
    undercurl = false,
    colors = {
      theme = {
        wave = {
          ui = {
            -- override gutter to be same as bg
            bg_gutter = "none",
          },
        },
      },
    },
    terminalColors = false,
  }
  vim.cmd.colorscheme "kanagawa-wave"
end

return M
