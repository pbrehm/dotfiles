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


-- when when pressing escape to exit insert mode sometimes its easy to pres esc+j which is the same as alt+J
-- this results in moving the line. I just unbind these in insert and visual mode
-- since I only need to move lines in normal mode
vim.api.nvim_set_keymap("i", "<A-j>", "", { desc = "Move down" })
vim.api.nvim_set_keymap("i", "<A-k>", "", { desc = "Move up" })
vim.api.nvim_set_keymap("v", "<A-j>", "", { desc = "Move down" })
vim.api.nvim_set_keymap("v", "<A-k>", "", { desc = "Move up" })
