-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- originally I used <leader>d
-- this conflicts with dap debug keybindings
-- I seldom use D and it functions the same as d$
-- remap D to delete to void
vim.api.nvim_set_keymap("n", "D", '"_d', { noremap = true })
vim.api.nvim_set_keymap("n", "DD", '"_dd', { noremap = true })

vim.api.nvim_set_keymap("x", "D", '"_d', { noremap = true })
vim.api.nvim_set_keymap("x", "DD", '"_dd', { noremap = true })

-- remap P in visual mode to delete then paste to not pollute registers
vim.api.nvim_set_keymap("x", "P", '"_dP', { noremap = true })
