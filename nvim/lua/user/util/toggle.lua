local M = {}

function M.diagnostics_buffer()
  local bufnr = vim.api.nvim_get_current_buf()
  if vim.diagnostic.is_disabled(bufnr) then
    vim.diagnostic.enable(bufnr)
    vim.notify "Enabled diagnostics for buffer"
  else
    vim.diagnostic.disable(bufnr)
    vim.notify "Disabled diagnostics for buffer"
  end
end

function M.diagnostics()
  if vim.diagnostic.is_disabled() then
    vim.diagnostic.enable()
    vim.notify "Enabled diagnostics globally"
  else
    vim.diagnostic.disable()
    vim.notify "Disabled diagnostics globally"
  end
end

return M
