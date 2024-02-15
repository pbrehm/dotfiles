local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
}

function M.config()
  require("nvim-treesitter.configs").setup {
    ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "typescript", "javascript" },
    highlight = { enable = true },
    indent = { enable = true },
  }
end

return M


-- TODO: consider adding other treesitter plugins
-- nvim-treesitter-textopbejts
-- nvim-treesitter-context
