local M = {}

function M.diagnostics_buffer(notify)
  local bufnr = vim.api.nvim_get_current_buf()
  -- vim.notify(vim.inspect(bufnr))
  -- vim.notify(vim.inspect(vim.diagnostic.is_enabled { bufnr = bufnr }))

  if vim.diagnostic.is_enabled { bufnr = bufnr } then
    vim.diagnostic.enable(false, { bufnr = bufnr })
    if notify then
      vim.notify "Disabled diagnostics for buffer"
    end
  else
    vim.diagnostic.enable(true, { bufnr = bufnr })
    if notify then
      vim.notify "Enabled diagnostics for buffer"
    end
  end
end

function M.diagnostics()
  if vim.diagnostic.is_enabled() then
    vim.diagnostic.enable(false)
    vim.notify "Disabled diagnostics globally"
  else
    vim.diagnostic.enable()
    vim.notify "Enabled diagnostics globally"
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

-- the following functions are to maintain state of dap ui window so we can open and close it explicitly
-- we do this because the events provided open and close it many times.
-- Also, when trouble opens, it messes up dap ui.
-- so we check if dap ui is opened and close it when opening trouble on test completion

-- Variable to track the DAP UI state
local dapui_open = false

-- Function to set the state
function M.dap_set_state(state)
  dapui_open = state
  -- print("dapui_open = " .. tostring(dapui_open))
end

-- Function to toggle the state
function M.dap_toggle_state()
  dapui_open = not dapui_open
  -- print("dapui_open = " .. tostring(dapui_open))
  return dapui_open
end

-- Function to check the state
function M.dap_is_open()
  return dapui_open
end

return M
