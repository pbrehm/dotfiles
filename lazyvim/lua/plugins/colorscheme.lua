return {
  -- add github theme
  { "projekt0n/github-nvim-theme" },
  { "rose-pine/neovim", name = "rose-pine" },
  { "Mofiqul/vscode.nvim" },
  -- {
  --   "olimorris/onedarkpro.nvim",
  -- },
  { "rebelot/kanagawa.nvim" },
  {
    "folke/tokyonight.nvim",
    opts = {
      on_colors = function(colors)
        -- colors.bg = "#000000"
        -- colors.bg_sidebar = "#0c0c0c"
        -- colors.bg_float = "#0c0c0c"

        colors.bg = "#0c0c14"
        colors.bg_sidebar = "#0f101a"
        colors.bg_float = "#0f101a"
        -- colors.bg_statusline = "#1e1e2e"
        -- colors.bg_statusline = "#0f101a"
      end,
    },
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    -- opts = {
    --   color_overrides = {
    --     mocha = {
    --       base = "#0c0c13",
    --       mantle = "#07070b",
    --       crust = "#0d0d0d",
    --     },
    --   },
    -- },
  },
  {
    "navarasu/onedark.nvim",
    opts = {
      -- style = "deep",
      -- style = "darker",
      -- colors = {
      -- black = "#000000",
      -- bg0 = "#111111",
      -- bg1 = "#1a1a1a",
      -- bg2 = "#000000",
      -- bg3 = "#000000",
      -- bg_d = "#111111",
      -- },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "github_dark_high_contrast",
      colorscheme = "onedark",
      -- colorscheme = "tokyonight-moon",
      -- colorscheme = "tokyonight-storm",
      -- colorscheme = "tokyonight-night",
      -- colorscheme = "catppuccin",
      -- colorscheme = "rose-pine"
    },
  },
}
