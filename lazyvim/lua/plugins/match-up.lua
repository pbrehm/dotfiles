return {
  {
    "andymass/vim-matchup",
    commit = "e2cca1747ab175b8d839a5d28679427564643a57"
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
