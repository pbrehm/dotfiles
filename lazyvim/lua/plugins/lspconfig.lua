return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "yioneko/nvim-vtsls",
  },
  opts = {
    servers = {
      vtsls = {
        keys = {
          {
            "<leader>co",
            -- function()
            --   vim.lsp.buf.code_action({
            --     apply = true,
            --     context = {
            --       only = { "source.organizeImports" },
            --       diagnostics = {},
            --     },
            --   })
            -- end,
            "<cmd>VtsExec organize_imports<cr>",
            desc = "Organize Imports",
          },
          {
            "<leader>cR",
            -- function()
            --   vim.lsp.buf.code_action({
            --     apply = true,
            --     context = {
            --       only = { "source.removeUnusedImports" },
            --       diagnostics = {},
            --     },
            --   })
            -- end,
            "<cmd>VtsExec remove_unused_imports<cr>",
            desc = "Remove Unused Imports",
          },
        },
        settings = {
          typescript = {
            format = {
              indentSize = vim.o.shiftwidth,
              convertTabsToSpaces = vim.o.expandtab,
              tabSize = vim.o.tabstop,
            },
          },
          javascript = {
            format = {
              indentSize = vim.o.shiftwidth,
              convertTabsToSpaces = vim.o.expandtab,
              tabSize = vim.o.tabstop,
            },
          },
          completions = {
            completeFunctionCalls = true,
          },
        },
      },
    },
  },
}
