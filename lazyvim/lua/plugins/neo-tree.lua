local Util = require("lazyvim.util")

return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    event_handlers = {
      {
        event = "vim_buffer_enter",
        handler = function()
          if vim.bo.filetype == "neo-tree" then
            vim.cmd([[setlocal number relativenumber cursorlineopt=both]])
          end
        end,
      },
    },
  },
  keys = {
    {
      "<leader>fE",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = Util.root() })
      end,
      desc = "Explorer NeoTree (root dir)",
    },
    {
      "<leader>fe",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
      end,
      desc = "Explorer NeoTree (cwd)",
    },
    { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (cwd)", remap = true },
    { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (root dir)",      remap = true },
  }
}
