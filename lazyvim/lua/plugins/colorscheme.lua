return {
  -- add github theme
  { "projekt0n/github-nvim-theme" },

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
  -- { "dasupradyumna/midnight.nvim" },
  -- { "bluz71/vim-moonfly-colors", name = "moonfly" },
  {
    "navarasu/onedark.nvim",
    opts = {
      -- style = "deep",
      style = "darker",
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
      -- colorscheme = "github_dark_dimmed",
      colorscheme = "tokyonight-night",
      -- colorscheme = "moonfly",
      -- colorscheme = "catppuccin",
      -- colorscheme = "rose-pine"
    },
  },
}
