local M = {}

function M.diagnostics_buffer(notify)
  local bufnr = vim.api.nvim_get_current_buf()
  if vim.diagnostic.is_disabled(bufnr) then
    vim.diagnostic.enable(bufnr)
    if notify then
      vim.notify "Enabled diagnostics for buffer"
    end
  else
    vim.diagnostic.disable(bufnr)
    if notify then
      vim.notify "Disabled diagnostics for buffer"
    end
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

function M.spell()
  -- Toggle spell check
  vim.wo.spell = not vim.wo.spell

  -- Check if spell check is enabled or disabled and notify the user accordingly
  local spell_enabled = vim.wo.spell
  if spell_enabled then
    -- Spell check is enabled
    vim.notify "Spell check enabled for window"
  else
    -- Spell check is disabled
    vim.notify "Spell check disabled for window"
  end
end

function M.relativeLineNumbers()
  if vim.wo.relativenumber then
    vim.wo.relativenumber = false
    vim.notify "relative line number disabled"
  else
    vim.wo.relativenumber = true
    vim.notify "relative line number enabled"
  end
end
return M
