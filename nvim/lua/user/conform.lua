local M = {
  "stevearc/conform.nvim",
}

function M.config()
  require("conform").setup {
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
      -- Override to allow formatting of big file. Helpful for big json file. May require async
      ["bigfile"] = { "prettierd", "eslint_d" },
      ["jsonc"] = { "prettierd", "eslint_d" },
      ["yaml"] = { "prettierd", "eslint_d" },
      ["markdown"] = { "prettierd", "eslint_d" },
      ["markdown.mdx"] = { "prettierd", "eslint_d" },
      ["graphql"] = { "prettierd", "eslint_d" },
      ["handlebars"] = { "prettierd", "eslint_d" },
      ["sql"] = { "sql_formatter" },
      ["lua"] = { "stylua" },
      ["go"] = { "gofmt" },
      ["java"] = { "clang-format" },
    },
  }
  local wk = require "which-key"
  wk.add {
    {
      "<leader>cf",
      function()
        require("conform").format(
          -- { async = true }
        )
      end,
      desc = "Format",
      mode = { "v", "n" },
    },
  }
end

return M
