local M = {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first time
  keys = {
    { "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
  },
}

function M.config()
  require("lazy").setup()
  vim.cmd "highlight LazyGitFloat guibg=#16161d guifg=#c8c093"
  vim.cmd "highlight LazyGitBorder guibg=#16161d guifg=#c8c093"
end
return M
