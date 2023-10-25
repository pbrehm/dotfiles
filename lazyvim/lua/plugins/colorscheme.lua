return {
  -- add github theme
  { "projekt0n/github-nvim-theme" },
  { "rebelot/kanagawa.nvim" },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "stevedylandev/flexoki-nvim", name = "flexoki" },
  { "rose-pine/neovim", name = "rose-pine" },
  { "Mofiqul/vscode.nvim" },
  { "bluz70/vim-nightfly-colors", name = "nightfly" },
  { "bluz70/vim-moonfly-colors", name = "moonfly" },
  -- {
  --   "olimorris/onedarkpro.nvim",
  -- },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      color_overrides = {
        mocha = {
          base = "#111111",
          mantle = "#111111",
          crust = "#111111",
          -- base = "#000000",
          -- mantle = "#000000",
          -- crust = "#000000",
        },
      },
      -- integrations = {
      --   telescope = {
      --     enabled = true,
      --     style = "nvchad",
      --   },
      --   dropbar = {
      --     enabled = true,
      --     color_mode = true,
      --   },
      -- },
    },
  },
  {
    "navarasu/onedark.nvim",
    opts = {
      style = "darker",
      colors = {
        -- black = "#000000",
        bg0 = "#111111",
        bg1 = "#1a1a1a",
        -- bg2 = "#000000",
        -- bg3 = "#000000",
        bg_d = "#111111",
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "github_dark_high_contrast",
      colorscheme = "onedark",
      -- colorscheme = "tokyonight-night",
      -- colorscheme = "catppuccin",
      -- colorscheme = "rose-pine"
    },
  },
}
