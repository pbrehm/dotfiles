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
    -- null_ls.builtins.formatting.sqlfluff.with(commonConfig),
    null_ls.builtins.diagnostics.sqlfluff.with(commonConfig),
  },
}

return {
  {
    "jose-elias-alvarez/null-ls.nvim",

    opts = opts
  },
}


-- Below is a poc in which I change the dialect on demand
-- and print to user the current dialect
--
-- local null_ls = require("null-ls")
--
-- -- Define a variable to keep track of the current arguments
-- local currentArgs = { "--dialect", "postgres" }
--
-- -- Function to toggle between Oracle and PostgreSQL arguments
-- function toggleSqlArgs()
--   if currentArgs[2] == "postgres" then
--     local arg = "oracle"
--     vim.api.nvim_out_write(arg .. "\n")
--     currentArgs[2] = "oracle"
--   else
--     local arg = "postgres"
--     vim.api.nvim_out_write(arg .. "\n")
--     currentArgs[2] = arg
--   end
--   updateSqlConfiguration()
-- end
--
-- -- Function to update the null-ls configuration with the current arguments
-- function updateSqlConfiguration()
--   opts = getOpts()
-- end
--
-- -- Function to generate the opts table based on the current arguments
-- function getOpts()
--   return {
--     sources = {
--       null_ls.builtins.formatting.sql_formatter,
--       null_ls.builtins.formatting.sqlfluff.with({
--         extra_args = currentArgs,
--       }),
--       null_ls.builtins.diagnostics.sqlfluff.with({
--         extra_args = currentArgs,
--       }),
--     },
--   }
-- end
--
-- -- Initialize opts with the current arguments
-- local opts = getOpts()
--
-- -- Map a key combination to toggle the SQL arguments and update the null-ls configuration
-- vim.api.nvim_set_keymap('n', '<leader>ct', [[:lua toggleSqlArgs()<CR>]], { noremap = true, silent = true })
--
-- return {
--   {
--     "jose-elias-alvarez/null-ls.nvim",
--
--     opts = opts
--   },
-- }
