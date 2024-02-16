-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- originally I used <leader>d
-- this conflicts with dap debug keybindings
-- I seldom use D and it functions the same as d$
-- remap D to delete to void
-- vim.api.nvim_set_keymap("n", "D", '"_d', { noremap = true })
-- vim.api.nvim_set_keymap("n", "DD", '"_dd', { noremap = true })

-- vim.api.nvim_set_keymap("x", "D", '"_d', { noremap = true })
-- vim.api.nvim_set_keymap("x", "DD", '"_dd', { noremap = true })

-- remap P in visual mode to delete then paste to not pollute registers
-- vim.api.nvim_set_keymap("x", "P", '"_dP', { noremap = true })


local map = vim.api.nvim_set_keymap
-- send pasted over text to void buffer so that I don't lose what I'm pasting
map("x", "p", [["_dP]], { noremap = true, silent = true })

-- when when pressing escape to exit insert mode sometimes its easy to pres esc+j which is the same as alt+J
-- this results in moving the line. I just unbind these in insert and visual mode
-- since I only need to move lines in normal mode
map("i", "<A-j>", "", { desc = "Move down DISABLED" })
map("i", "<A-k>", "", { desc = "Move up DISABLED" })
map("v", "<A-j>", "", { desc = "Move down DISABLED" })
map("v", "<A-k>", "", { desc = "Move up DISABLED" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
-- then center afterwords
map("n", "n", "'Nn'[v:searchforward].'zvzz'", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward].'zz'", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward].'zz'", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward].'zvzz'", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward].'zz'", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward].'zz'", { expr = true, desc = "Prev search result" })


map("n", "<S-h>", "", { desc = "Prev buffer DISABLED" })
map("n", "<S-l>", "", { desc = "Next buffer DISABLED" })
