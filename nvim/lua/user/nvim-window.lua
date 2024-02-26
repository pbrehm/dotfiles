local M = {
  "yorickpeterse/nvim-window",
}

M.keys = {
  { "<leader>w", "<cmd>lua require('nvim-window').pick()<cr>", desc = "nvim-window: Jump to window" },
}

M.config = true

return M
