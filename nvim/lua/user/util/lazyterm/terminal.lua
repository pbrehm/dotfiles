local M = {

}

---@class LazyCmdOptions: LazyFloatOptions
---@field cwd? string
---@field env? table<string,string>
---@field float? LazyFloatOptions

-- Opens a floating terminal (interactive by default)
---@param cmd? string[]|string
---@param opts? LazyCmdOptions|{interactive?:boolean}
function M.float_term(cmd, opts)
  cmd = cmd or {}
  if type(cmd) == "string" then
    cmd = { cmd }
  end
  if #cmd == 0 then
    cmd = { vim.o.shell }
  end
  opts = opts or {}
  local float = require("user.util.lazyterm.float")(opts)
  vim.fn.termopen(cmd, vim.tbl_isempty(opts) and vim.empty_dict() or opts)
  if opts.interactive ~= false then
    vim.cmd.startinsert()
    vim.api.nvim_create_autocmd("TermClose", {
      once = true,
      buffer = float.buf,
      callback = function()
        float:close({ wipe = true })
        vim.cmd.checktime()
      end,
    })
  end
  return float
end

-- Opens a floating terminal (interactive by default)
---@param cmd? string[]|string
---@param opts? LazyCmdOptions|{interactive?:boolean}
function M.open(cmd, opts)
  opts = vim.tbl_deep_extend("force", {
    size = { width = 0.9, height = 0.9 },
  }, opts or {})
  M.float_term(cmd, opts)
end

return M
