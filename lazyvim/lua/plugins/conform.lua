return {
  {
    "stevearc/conform.nvim",
    opts = {
      -- install eslint-lsp via mason if you want to see eslint diagnostics
      formatters_by_ft = {
        ["javascript"] = { "prettierd", "eslint_d" },
        ["javascriptreact"] = { "prettierd", "eslint_d" },
        ["typescript"] = { "prettierd", "eslint_d" },
        ["typescriptreact"] = { "prettierd", "eslint_d" },
        ["vue"] = { "prettierd", "eslint_d" },
        ["css"] = { "prettierd", "eslint_d" },
        ["scss"] = { "prettierd", "eslint_d" },
        ["less"] = { "prettierd", "eslint_d" },
        ["html"] = { "prettierd", "eslint_d" },
        ["json"] = { "prettierd", "eslint_d" },
        ["jsonc"] = { "prettierd", "eslint_d" },
        ["yaml"] = { "prettierd", "eslint_d" },
        ["markdown"] = { "prettierd", "eslint_d" },
        ["markdown.mdx"] = { "prettierd", "eslint_d" },
        ["graphql"] = { "prettierd", "eslint_d" },
        ["handlebars"] = { "prettierd", "eslint_d" },
        ["sql"] = { "sql_formatter" },
      },
    },
  },
}
