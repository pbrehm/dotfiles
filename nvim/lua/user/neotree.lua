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
      "<cmd>Neotree reveal<cr>",
      desc = "Explorer NeoTree reveal",
    },
    {
      "<leader>E",
      "<cmd>Neotree close<cr>",
      desc = "Explorer NeoTree close",
    },
    {
      "<leader>ge",
      "<cmd>Neotree git_status<cr>",
      desc = "Explorer NeoTree Git Status",
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
        ["<bs>"] = "none" -- disabled since easy to accientl press on new keyboard but there is no undo function
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
            vim.cmd [[setlocal number relativenumber 
            " cursorlineopt=both
            ]]
          end
        end,
      },
    },
  }
end

return M
