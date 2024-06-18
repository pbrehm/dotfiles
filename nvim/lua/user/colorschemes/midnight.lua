local M =
{ 'dasupradyumna/midnight.nvim', lazy = false, priority = 1000 }

function M.config()
  vim.cmd.colorscheme "midnight"
end

return M
