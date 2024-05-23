-- https://github.com/yioneko/vtsls/blob/bd2df5a2d45cbc087e4fe285ec7c7396fd96e9cf/packages/service/configuration.schema.json#L98
return {
  settings = {
    typescript = {
      format = {
        indentSize = vim.o.shiftwidth,
        convertTabsToSpaces = vim.o.expandtab,
        tabSize = vim.o.tabstop,
      },
      inlayHints = {
        parameterNames = { enabled = "literals" },
        parameterTypes = { enabled = true },
        variableTypes = { enabled = true
          -- , suppressWhenTypeMatchesName = { enabled = false }
        },
        propertyDeclarationTypes = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        enumMemberValues = { enabled = true },
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
}
