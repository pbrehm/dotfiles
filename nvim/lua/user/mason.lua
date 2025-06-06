local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    { "WhoIsSethDaniel/mason-tool-installer.nvim" },
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
    -- "gopls",
    "jdtls",
    "lemminx",
    -- "ruby_lsp",
  }

  require("mason-tool-installer").setup {
    ensure_installed = {
      -- formatters required for conform
      "prettierd",
      "eslint_d",
      "sql-formatter",
      "stylua",
      "clang-format",
      -- "erb-formatter",
      -- "erb-lint",

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
