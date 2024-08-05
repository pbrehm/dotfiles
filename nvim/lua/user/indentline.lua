local M = {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  main = "ibl",
}

function M.config()
  require("ibl").setup {
    indent = {
      char = "│",
      tab_char = "│",
    },
    scope = { enabled = true, show_start = false, show_end = false },
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
        "Aerial",
        "Outline",
        "Git",
      },
    },
  }
end

return M
