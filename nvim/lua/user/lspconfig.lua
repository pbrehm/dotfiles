local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "folke/neodev.nvim",
    "yioneko/nvim-vtsls"
  },
}

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap(bufnr, "n", "gd", '<cmd>lua require("telescope.builtin").lsp_definitions({ reuse_win = true })<CR>', opts)
  keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  keymap(bufnr, "n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
  -- keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)

  if client.supports_method "textDocument/inlayHint" then
    vim.lsp.inlay_hint.enable(bufnr, true)
  end
end

function M.common_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return capabilities
end

M.toggle_inlay_hints = function()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.lsp.inlay_hint.enable(bufnr, not vim.lsp.inlay_hint.is_enabled(bufnr))
end

function M.config()
  require("lspconfig.configs").vtsls = require('vtsls').lspconfig
  local wk = require "which-key"
  wk.register {
    ["<leader>ca"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    -- formatter keybind added to conform
    -- ["<leader>cf"] = {
    --   "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
    --   "Format",
    -- },
    ["<leader>ci"] = { "<cmd>LspInfo<cr>", "Info" },
    -- ["<leader>lj"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
    ["<leader>uh"] = { "<cmd>lua require('user.lspconfig').toggle_inlay_hints()<cr>", "Hints" },
    -- ["<leader>lk"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
    ["<leader>cA"] = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    -- ["<leader>lq"] = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
    ["<leader>cr"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    ["<leader>co"] = { "<cmd>VtsExec organize_imports<cr>", "Organize Imports (vtsls)" },
    ["<leader>cR"] = { "<cmd>VtsExec remove_unused_imports<cr>", "Remove Unused Imports (vtsls)" },
  }

  wk.register {
    ["<leader>ca"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action", mode = "v" },
  }

  local lspconfig = require "lspconfig"
  local icons = require "user.resources.icons"

  local servers = {
    "lua_ls",
    "vtsls",
    -- "tsserver",
    "bashls",
    "jsonls",
    "eslint",
  }

  local default_diagnostic_config = {
    signs = {
      active = true,
      values = {
        { name = "DiagnosticSignError", text = icons.diagnostics.BoldError },
        { name = "DiagnosticSignWarn",  text = icons.diagnostics.BoldWarning },
        { name = "DiagnosticSignHint",  text = icons.diagnostics.BoldHint },
        { name = "DiagnosticSignInfo",  text = icons.diagnostics.BoldInformation },
      },
    },
    virtual_text = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      -- border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(default_diagnostic_config)

  for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end

  -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
  -- require("lspconfig.ui.windows").default_options.border = "rounded"

  for _, server in pairs(servers) do
    local opts = {
      on_attach = M.on_attach,
      capabilities = M.common_capabilities(),
    }

    local require_ok, settings = pcall(require, "user.lspsettings." .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", settings, opts)
    end

    if server == "lua_ls" then
      require("neodev").setup {}
    end

    lspconfig[server].setup(opts)
  end
end

return M
