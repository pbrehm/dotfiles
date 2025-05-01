local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    { "WhoIsSethDaniel/mason-tool-installer.nvim", commit = "1212fb6082b7177dde17ea65e429e027835aeb40" },
    -- after update to 6c15772d5e4a01d0b2ad3ad6df23cf38517c4ad2 getting errors when trying to find modules via mason
  },
}

function M.config()
  local servers = {
    "lua_ls",
    "vtsls",
    -- "tsserver",
    "bashls",
    "jsonls",
    "eslint",
    "yamlls",
    "gopls",
    "jdtls",
    "lemminx",
    "ruby_lsp",
  }

  require("mason-tool-installer").setup {
    ensure_installed = {
      -- formatters required for conform
      "prettierd",
      "eslint_d",
      "sql-formatter",
      "stylua",
      "clang-format",
      "erb-formatter",
      "erb-lint",

      -- debugger required for dap with typescript
      "js-debug-adapter",
    },
  }

  require("mason").setup {
    -- ui = {
    --   border = "rounded",
    -- },
  }

  require("mason-lspconfig").setup {
    ensure_installed = servers,
  }
end

return M
