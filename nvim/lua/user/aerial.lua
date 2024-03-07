local M = {
  "stevearc/aerial.nvim",
}

function M.config()
  local opts = function()
    local icons = require("user.resources.icons").kind

    local opts = {
      attach_mode = "global",
      backends = { "lsp", "treesitter", "markdown", "man" },
      show_guides = true,
      layout = {
        resize_to_content = false,
        -- win_opts = {
        --   winhl = "Normal:NormalFloat,FloatBorder:NormalFloat,SignColumn:SignColumnSB",
        --   signcolumn = "yes",
        --   statuscolumn = " ",
        -- },
      },
      icons = icons,
      filter_kind = {
        default = {
          "Class",
          "Constructor",
          "Enum",
          "Field",
          "Function",
          "Interface",
          "Method",
          "Module",
          "Namespace",
          "Package",
          "Property",
          "Struct",
          "Trait",
        },
        markdown = false,
        help = false,
        -- you can specify a different filter for each filetype
        lua = {
          "Class",
          "Constructor",
          "Enum",
          "Field",
          "Function",
          "Interface",
          "Method",
          "Module",
          "Namespace",
          -- "Package", -- remove package since luals uses it for control flow structures
          "Property",
          "Struct",
          "Trait",
        },
      },
    -- stylua: ignore
    guides = {
      mid_item   = "├╴",
      last_item  = "└╴",
      nested_top = "│ ",
      whitespace = "  ",
    },
    }
    return opts
  end

  local originalOpts = {
    filter_kind = false,
    -- optionally use on_attach to set keymaps when aerial has attached to a buffer
    on_attach = function(bufnr)
      -- Jump forwards/backwards with '{' and '}'
      vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
      vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
    end,
  }
  require("aerial").setup(opts())
  -- You probably also want to set a keymap to toggle aerial
  vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
  -- vim.keymap.set("n", "<leader>a", "<cmd>AerialOpenAll<CR>")
  -- vim.keymap.set("n", "<leader>A", "<cmd>AerialClose<CR>")
end

return M
