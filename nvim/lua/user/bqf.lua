local M = {
  "kevinhwang91/nvim-bqf",
}

function M.config()
  require("bqf").setup {
    preview = {
      auto_preview = false,
    },
  }
end
return M
