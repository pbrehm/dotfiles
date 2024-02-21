local M = {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  keys = {
    {
      "<leader>e",
      "<cmd>Neotree toggle<cr>",
      desc = "Explorer NeoTree (cwd)",
    },
  },

}

function M.config()
  require("neo-tree").setup {
    window = {
      mappings = {
        ["z"] = "none",
        ["C"] = "close_all_nodes",
        ["c"] = "close_node",
        ["<space>"] = "none",
      },
    },
    filesystem = {
      follow_current_file = { enabled = true },
    },
    event_handlers = {
      {
        event = "vim_buffer_enter",
        handler = function()
          if vim.bo.filetype == "neo-tree" then
            vim.cmd [[setlocal number relativenumber cursorlineopt=both]]
          end
        end,
      },
    },
  }
end

return M
