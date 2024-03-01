local actions_state = require "telescope.actions.state"
local actions = require "telescope.actions"

local function diff_view_open_hash(hash)
  local cmd = "DiffviewOpen " .. hash .. "^1" .. ".." .. hash
  vim.api.nvim_command(cmd)
end

-- Opens diff view with commit of blame on current line
local function diff_view_open_blame_commit()
  -- Get the current line number
  local current_line = vim.fn.line "."
  -- vim.notify("current_line = " .. current_line)

  -- Execute git command to get the commit hash at the current line
  local git_command = string.format("git blame -L " .. current_line .. ",+1 -- %s", vim.fn.expand "%:p")
  -- vim.notify(git_command)
  local command_output = vim.fn.systemlist(git_command)
  -- vim.notify(vim.inspect(command_output))
  for _, value in ipairs(command_output) do
    local hash = string.sub(value, 1, 8)
    -- vim.notify("..." .. hash .. "...")
    -- "00000000" = existing file with change that isn't committed
    -- "fatal: n" = untracked file
    if hash == "00000000" or hash == "fatal: n" then
      vim.notify "Not Commited Yet"
    else
      diff_view_open_hash(hash)
    end
  end
end

local telescope_open_commit = function(prompt_bufnr)
  local selected_entry = actions_state.get_selected_entry()
  actions.close(prompt_bufnr)
  diff_view_open_hash(selected_entry.value)
end

local opts = {
  attach_mappings = function(_, map)
    map("n", "<cr>", telescope_open_commit)
    map("i", "<cr>", telescope_open_commit)
    return true
  end,
}

local M = {
  "sindrets/diffview.nvim",
  lazy = false,
}

M.keys = {
  { "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "DiffviewFileHistory (branch)" },
  { "<leader>gH", "<cmd>DiffviewFileHistory %<cr>", desc = "DiffviewFileHistory (file)" },
  { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "DiffviewOpen" },
  {
    "<leader>gc",
    function()
      require("telescope.builtin").git_commits(opts)
    end,
    desc = "Telescope commits (branch) -> DiffviewOpen compare to now",
  },
  {
    "<leader>gC",
    function()
      require("telescope.builtin").git_bcommits(opts)
    end,
    desc = "Telescope commits (file) -> DiffviewOpen compare to now",
  },
  {
    "<leader>gB",
    function()
      diff_view_open_blame_commit()
    end,
    desc = "DiffViewOpen blame commit",
  },
}

return M
