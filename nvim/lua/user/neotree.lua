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
  local function on_move(data)
    Snacks.rename.on_rename_file(data.source, data.destination)
  end
  local events = require("neo-tree.events")
  require("neo-tree").setup {
    window = {
      mappings = {
        ["z"] = "none",
        ["C"] = "close_all_nodes",
        ["c"] = "close_node",
        ["<space>"] = "none",
        ["<bs>"] = "none", -- disabled since easy to accientl press on new keyboard but there is no undo function
        ["M"] = function(state) -- mark a file with grapple
          local node = state.tree:get_node()
          -- require("grapple").tag({ path = node.path })
          require("grapple").toggle({ path = node.path })
        end
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
      { event = events.FILE_MOVED, handler = on_move },
      { event = events.FILE_RENAMED, handler = on_move },
    },
  }
end

return M
