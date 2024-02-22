local M = {
  "mbbill/undotree",
  keys = {
    {
      "<leader>z",
      vim.cmd.UndotreeToggle,
      desc = "Toggle Undotree",
    },
  },
}

return M
