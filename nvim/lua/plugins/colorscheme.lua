return {
  -- {
  --   "folke/tokyonight.nvim",
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme 'tokyonight-night'
  --   end,
  -- },
  {
    "rebelot/kanagawa.nvim",
    opts = {
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
    },
  },
}
