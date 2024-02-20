return {
  {
    "andymass/vim-matchup",
    -- disable clock since tmux has it
  },
  -- enable treesitter support for matchup
  -- this allows things like using "%" on an if statement etc.
  {
    "nvim-treesitter/nvim-treesitter",
    config = {
      matchup = {
        enable = true
      }
    }
  }
}
