-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

--when exiting gitsign. if you exit the wrong window signcolumn gets set to "no"
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "",
  callback = function()
    if vim.bo.buftype == "" then
      vim.wo.signcolumn = "yes"
      -- vim.schedule(function()
      -- print("signcolumn set to yes")
      -- end)
    end
  end,
})
