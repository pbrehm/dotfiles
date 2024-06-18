local M = { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 }

function M.config()
  vim.cmd.colorscheme "moonfly"
end
return M
