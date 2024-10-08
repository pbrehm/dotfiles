local tags = "TODO,FIX,FIXME,PB"
local tagsCommand = "keywords=" .. tags

local M = {
  "folke/todo-comments.nvim",
  commit = "a7e39ae9e74f2c8c6dc4eea6d40c3971ae84752d",
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
      -- { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
      { "<leader>xt", "<cmd>TodoTrouble "..tagsCommand.."<cr>", desc = tags.." (Trouble)" },
      { "<leader>st", "<cmd>TodoTelescope "..tagsCommand.."<cr>", desc = tags.." tags" },
      -- { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
    },
}

return M
