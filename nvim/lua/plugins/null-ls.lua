return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    -- stolen from top comment here from FreeAd7233
    -- https://www.reddit.com/r/neovim/comments/12rkpfe/what_sql_formatter_do_you_use_what_can_give_you/
    -- https://github.com/milanglacier/nvim/blob/db850bbe400766932c1290c11d1e17672c324cbb/lua/conf/lsp_tools.lua#L173
    -- doesn'tgive you feedback if its formatted wrong

    opts = function()
      -- local sql_formatter_config_file = os.getenv 'HOME' .. '/.config/sql_formatter/sql_formatter.json'
      local function root_pattern_wrapper(patterns)
        -- referenced from
        -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/lua/null-ls/builtins/diagnostics/flake8.lua
        return require("null-ls.helpers").cache.by_bufnr(function(params)
          return require("null-ls.utils").root_pattern('.git', unpack(patterns or {}))(params.bufname)
        end)
      end
      local function source_wrapper(args)
        local source = args[1]
        local patterns = args[2]
        args[1] = nil
        args[2] = nil
        args.cwd = args.cwd or root_pattern_wrapper(patterns)
        return source.with(args)
      end
      return {
        sources = {
          source_wrapper({
            require("null-ls").builtins.formatting.sql_formatter,
            -- args = vim.fn.empty(vim.fn.glob(sql_formatter_config_file_)) == 0
            -- and { "--config", sql_formatter_config_file }
            -- or nill,
          }),
        },
      }
    end,
  },
}
