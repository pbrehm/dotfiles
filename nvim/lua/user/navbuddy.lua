local M = {
  "SmiteshP/nvim-navbuddy",
  dependencies = {
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim",
  },
}

function M.config()
  local wk = require "which-key"
  wk.register {
    ["<leader>o"] = { "<cmd>Navbuddy<cr>", "Nav" },
  }

  local navbuddy = require "nvim-navbuddy"
  -- local actions = require("nvim-navbuddy.actions")

  -- remove NavbuddyName highlight group because its broken with this theme
  vim.api.nvim_set_hl(0, "NavbuddyName", {})

  navbuddy.setup {
    window = {
      -- position = { row = "50%", col = "0%" },
      size = "80%",
      sections = {
        left = {
          size = "20%"
        },
        mid = {
          size = "30%"
        },
        right = {
          preview = "always",
        },
      },
    },
    icons = require("user.resources.icons").kind,
    lsp = { auto_attach = true },
    source_buffer = {
      highlight = true,
      follow_node = false,
    },
  }

  -- local opts = { noremap = true, silent = true }
  -- local keymap = vim.api.nvim_set_keymap
  --
  -- keymap("n", "<m-s>", ":silent only | Navbuddy<cr>", opts)
  -- keymap("n", "<m-o>", ":silent only | Navbuddy<cr>", opts)
end

return M
