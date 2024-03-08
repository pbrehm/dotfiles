local M = {
  "folke/persistence.nvim",
  event = "BufReadPre",
  opts = { options = vim.opt.sessionoptions:get() },
    -- stylua: ignore
    keys = {
      { "<leader>Rs", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>Rl", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>Rd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
}

return M
