local map = vim.keymap.set

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <alt> hjkl keys
map("n", "<M-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<M-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<M-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<M-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <alt><shift> hjkl
map("n", "<M-K>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<M-J>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<M-H>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<M-L>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
-- then center afterwords
map("n", "n", "'Nn'[v:searchforward].'zvzz'", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward].'zz'", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward].'zz'", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward].'zvzz'", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward].'zz'", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward].'zz'", { expr = true, desc = "Prev search result" })

-- center after up or down
map({ "n", "x" }, "<C-d>", "<C-d>zz")
map({ "n", "x" }, "<C-u>", "<C-u>zz")

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- lazy
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- new file
-- map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

-- map("n", "<leader>q", "<cmd>copen<cr>")
-- map("n", "<leader>Q", "<cmd>cclose<cr>")

-- not needed since trouble handles this
-- map("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
-- map("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go { severity = severity }
  end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- stylua: ignore start

-- toggle options
map("n", "<leader>uw", ":set wrap!<CR>", { desc = "toggle line wrap for buffer" })
local toggle = require("user.util.toggle")
map("n", "<leader>ud", function() toggle.diagnostics_buffer(true) end, { desc = "Toggle Diagnostics for current buffer" })
map("n", "<leader>uD", function() toggle.diagnostics() end, { desc = "Toggle Diagnostics globally" })
map("n", "<leader>us", function () toggle.spell() end, { desc = "Toggle Spell check for window" })

map  ( 'n', '<M-1>', ':1tabnext<CR>', { desc = "Go to tab #1", noremap = true, silent = true } )
map  ( 'n', '<M-2>', ':2tabnext<CR>', { desc = "Go to tab #2", noremap = true, silent = true } )
map  ( 'n', '<M-3>', ':3tabnext<CR>', { desc = "Go to tab #3", noremap = true, silent = true } )
map  ( 'n', '<M-4>', ':4tabnext<CR>', { desc = "Go to tab #4", noremap = true, silent = true } )
map  ( 'n', '<M-5>', ':5tabnext<CR>', { desc = "Go to tab #5", noremap = true, silent = true } )
map  ( 'n', '<M-6>', ':6tabnext<CR>', { desc = "Go to tab #6", noremap = true, silent = true } )
map  ( 'n', '<M-7>', ':7tabnext<CR>', { desc = "Go to tab #7", noremap = true, silent = true } )
map  ( 'n', '<M-8>', ':8tabnext<CR>', { desc = "Go to tab #8", noremap = true, silent = true } )
map  ( 'n', '<M-9>', ':9tabnext<CR>', { desc = "Go to tab #9", noremap = true, silent = true } )

map("n", '<leader>"', "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>%", "<C-W>v", { desc = "Split window right", remap = true })

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>$tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

local terminal = require("user.util.lazyterm.terminal")
map("n", "<leader>gg", function() terminal.open({ "lazygit" }) end, { desc = "Lazygit" })
-- personal keybinds
--
-- send pasted over text to void buffer so that I don't lose what I'm pasting
vim.api.nvim_set_keymap("x", "p", [["_dP]], { noremap = true, silent = true })
