local M = {
  "kevinhwang91/nvim-bqf",

  dependencies = {
    "junegunn/fzf", -- needed to use fzf mode. (zf keybin)
    build = ":call fzf#install()",
  },
}

function M.config()
  require("bqf").setup {
    preview = {
      auto_preview = false,
    },
  }
end
return M
