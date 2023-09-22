local null_ls = require("null-ls")

-- Define the common configuration options
local commonConfig = {
  extra_args = { "--dialect", "postgres" },
}

-- Create the opts table using the common configuration
-- find example configs here
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
local opts = {
  sources = {
    -- Just a universal whitewpace formatter
    null_ls.builtins.formatting.sql_formatter,

    -- diagnositcs and formatting
    null_ls.builtins.formatting.sqlfluff.with(commonConfig),
    null_ls.builtins.diagnostics.sqlfluff.with(commonConfig),
  },
}

return {
  {
    "jose-elias-alvarez/null-ls.nvim",

    opts = opts
  },
}
