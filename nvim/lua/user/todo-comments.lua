local tags = "TODO,FIX,FIXME,PB"
local tagsCommand = "keywords=" .. tags

local M = {
  "folke/todo-comments.nvim",
  -- commit = "a7e39ae9e74f2c8c6dc4eea6d40c3971ae84752d",
  cmd = { "TodoTrouble", "TodoTelescope" },
  config = true,
  event = "BufEnter",
  opts = {
    signs = false,
    keywords = {
      PB = {
        color = "info",
      },

    },
  },
    -- stylua: ignore
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
    -- for old commit below
      { "<leader>xt", "<cmd>TodoTrouble "..tagsCommand.."<cr>", desc = tags.." (Trouble)" },
      { "<leader>st", "<cmd>TodoTelescope "..tagsCommand.."<cr>", desc = tags.." tags" },
    -- for new commit below
      -- { "<leader>xt", "<cmd>Trouble todo toggle filter = {tag = {"..tags.."}}<cr>", desc = tags.." (Trouble)" }, -- TODO: thows errors sometimes
      { "<leader>st", "<cmd>TodoTelescope "..tagsCommand.."<cr>", desc = tags.." tags" },
    },
}
return M
