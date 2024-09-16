local tags = "TODO,FIX,FIXME,PB"
local tagsCommand = "keywords=" .. tags

local M = {
  "folke/todo-comments.nvim",
  cmd = { "TodoTrouble", "TodoTelescope" },
  config = true,
  event = "BufEnter",
  opts = {
    signs = false,
    keywords = {
      PB = {
        color = "info",
        icon = "",
      },
    },
  },
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>xt", "<cmd>Trouble todo toggle filter = {tag = {"..tags.."}}<cr>", desc = tags.." (Trouble)" },
      { "<leader>st", "<cmd>TodoTelescope "..tagsCommand.."<cr>", desc = tags.." tags" },
    },
}
return M
