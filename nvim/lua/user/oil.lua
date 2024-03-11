local M = {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
}

function M.config()
  require("oil").setup {
    columns = {
      "icon",
      -- "permissions",
      -- "size",
      -- "mtime",
    },
    default_file_explorer = true,
    float = {
      max_height = 20,
      max_width = 60,
    },
  }
  vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
end

return M
