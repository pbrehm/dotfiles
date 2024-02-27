local actions_state = require "telescope.actions.state"
local actions = require "telescope.actions"

local diffview_open_commit = function(prompt_bufnr)
  local selected_entry = actions_state.get_selected_entry()
  actions.close(prompt_bufnr)
  vim.api.nvim_command("DiffviewOpen " .. selected_entry.value)
end

local opts = {
  attach_mappings = function(_, map)
    map("n", "<cr>", diffview_open_commit)
    map("i", "<cr>", diffview_open_commit)
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
}

return M
