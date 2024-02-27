local M = {
  "lewis6991/gitsigns.nvim",
  event = "BufEnter",
  cmd = "Gitsigns",
}
M.config = function()
  local icons = require "user.resources.icons"

  local gs = require "gitsigns"
  local wk = require "which-key"
  wk.register {
    ["]h"] = { function() gs.next_hunk { navigation_message = false } end, "Next Hunk", },
    ["[h"] = { function() gs.prev_hunk { navigation_message = false } end, "Prev Hunk", },
    ["<leader>gp"] = { function() gs.preview_hunk_inline() end, "Preview Hunk Inline", },
    ["<leader>gb"] = { function() gs.blame_line { full = true } end, "Blame", },
    ["<leader>gS"] = { function() gs.stage_buffer() end, "Reset Buffer", },
    ["<leader>gR"] = { function() gs.reset_buffer() end, "Reset Buffer", },
    ["<leader>gs"] = { function() gs.stage_hunk() end, "Stage Hunk", },
    ["<leader>gr"] = { function() gs.reset_hunk() end, "Reset Hunk", },
    ["<leader>gu"] = { function() gs.undo_stage_hunk() end, "Undo Stage Hunk", },
    -- ["<leader>gd"] = { "<cmd>Gitsigns diffthis HEAD<cr>", "Git Diff", },
  }

  require("gitsigns").setup {
    signs = {
      add = {
        hl = "GitSignsAdd",
        text = icons.ui.BoldLineMiddle,
        numhl = "GitSignsAddNr",
        linehl = "GitSignsAddLn",
      },
      change = {
        hl = "GitSignsChange",
        text = icons.ui.BoldLineDashedMiddle,
        numhl = "GitSignsChangeNr",
        linehl = "GitSignsChangeLn",
      },
      delete = {
        hl = "GitSignsDelete",
        text = icons.ui.Triangle,
        numhl = "GitSignsDeleteNr",
        linehl = "GitSignsDeleteLn",
      },
      topdelete = {
        hl = "GitSignsDelete",
        text = icons.ui.Triangle,
        numhl = "GitSignsDeleteNr",
        linehl = "GitSignsDeleteLn",
      },
      changedelete = {
        hl = "GitSignsChange",
        text = icons.ui.BoldLineMiddle,
        numhl = "GitSignsChangeNr",
        linehl = "GitSignsChangeLn",
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
