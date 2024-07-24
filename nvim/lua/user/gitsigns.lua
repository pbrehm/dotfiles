local M = {
  "lewis6991/gitsigns.nvim",
  event = "BufEnter",
  cmd = "Gitsigns",
}
M.config = function()
  local icons = require "user.resources.icons"

  local gs = require "gitsigns"
  local wk = require "which-key"
  wk.add {
    {"]h", function() gs.next_hunk { navigation_message = false } end, desc= "Next Hunk", },
    {"[h", function() gs.prev_hunk { navigation_message = false } end, desc= "Prev Hunk", },
    {"<leader>gp", function() gs.preview_hunk_inline() end, desc= "Preview Hunk Inline", },
    {"<leader>gb", function() gs.blame_line { full = true } end, desc= "Blame", },
    {"<leader>gS", function() gs.stage_buffer() end, desc= "Reset Buffer", },
    {"<leader>gR", function() gs.reset_buffer() end, desc= "Reset Buffer", },
    {"<leader>gs", function() gs.stage_hunk() end, desc= "Stage Hunk", },
    {"<leader>gr", function() gs.reset_hunk() end, desc= "Reset Hunk", },
    {"<leader>gu", function() gs.undo_stage_hunk() end, desc= "Undo Stage Hunk", },
    -- {"<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Git Diff", },
  }

  require("gitsigns").setup {
    signs = {
      add = {
        text = icons.ui.BoldLineMiddle,
      },
      change = {
        text = icons.ui.BoldLineDashedMiddle,
      },
      delete = {
        text = icons.ui.Triangle,
      },
      topdelete = {
        text = icons.ui.Triangle,
      },
      changedelete = {
        text = icons.ui.BoldLineMiddle,
      },
    },
    watch_gitdir = {
      interval = 1000,
      follow_files = true,
    },
    attach_to_untracked = true,
    current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
    update_debounce = 200,
    max_file_length = 40000,
    preview_config = {
      border = "single",
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1,
    },
  }
end

return M
