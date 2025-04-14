-- stolen and enhanced to deal with app prefix
local find_tsc_bin = function()
  local node_modules_tsc_binary = vim.fn.findfile("node_modules/.bin/tsc", ".;")
  if node_modules_tsc_binary ~= "" then
    return node_modules_tsc_binary
  end
  local app_node_modules_tsc_binary = vim.fn.findfile("app/node_modules/.bin/tsc", ".;")

  if app_node_modules_tsc_binary ~= "" then
    return app_node_modules_tsc_binary
  end

  return "tsc"
end

local find_nearest_tsconfig = function()
  local tsconfig = vim.fn.findfile("tsconfig.json", ".;")
  if tsconfig ~= "" then
    return tsconfig
  end

  local app_tsconfig = vim.fn.findfile("app/tsconfig.json", ".;")
  if app_tsconfig ~= "" then
    return app_tsconfig
  end

  return nil
end

local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- "folke/neodev.nvim",
    "yioneko/nvim-vtsls",
    {
      "dmmulroy/tsc.nvim",
      lazy = true,
      ft = { "typescript", "typescriptreact" },
      config = function()
        require("tsc").setup {
          auto_open_qflist = true,
          auto_close_qflist = false,
          auto_focus_qflist = false,
          auto_start_watch_mode = false,
          bin_path = find_tsc_bin(),
          enable_progress_notifications = true,
          flags = {
            noEmit = true,
            project = function()
              return find_nearest_tsconfig()
            end,
            watch = false,
          },
          hide_progress_notifications_from_history = true,
          spinner = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
          pretty_errors = true,
        }
      end,
    },
    "nvim-java/nvim-java",
  },
}

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap(bufnr, "n", "gd", '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', opts)
  -- keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  -- This is a default keybind now
  -- keymap(bufnr, "n", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  -- use default <C-S> in insert mode
  keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  keymap(bufnr, "n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
  keymap(bufnr, "n", "<leader>cc", ":TSC<cr>", opts)
  -- keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
  local cmd = client.config.cmd[1]
  -- vim.notify("cmd".. cmd)
  -- if client.supports_method "textDocument/inlayHint" then
  -- yamlls doesn't seem to actually support inlay hints.
  if string.find(cmd, "yaml%-language%-server") then
    local toggle = require "user.util.toggle"
    toggle.diagnostics_buffer(false)
  end

  -- vim.notify(vim.inspect(client.workspace_folders[1].name))
  -- vim.notify(vim.inspect(vim.fn.bufname(bufnr)))
  -- disable diagnostics when eslint lsp attaches and path includes node modules
  -- this is because esllint frequently has errors in node modules since it is build differently
  if string.find(cmd, "vscode%-eslint%-language%-server") and string.find(vim.fn.bufname(bufnr), "node_modules") then
    -- vim.notify("disable diagnostics for bufnr" .. bufnr)
    local toggle = require "user.util.toggle"
    toggle.diagnostics_buffer(false)
  end

  -- if client.supports_method "textDocument/inlayHint" then
  -- vim.lsp.inlay_hint.enable(bufnr, true)
  -- end
end

function M.common_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return capabilities
end

M.toggle_inlay_hints = function()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr }, { bufnr })
  if vim.lsp.inlay_hint.is_enabled { bufnr } then
    vim.notify "Inlay hints enabled"
  else
    vim.notify "Inlay hints disabled"
  end
end

function M.config()
  require("lspconfig.configs").vtsls = require("vtsls").lspconfig
  local wk = require "which-key"
  wk.add {
    {
      "<leader>ca",
      function()
        vim.lsp.buf.code_action()
      end,
      desc = "Code Action",
      mode = { "n", "v" },
    },
    -- formatter keybind added to conform
    -- ["<leader>cf"] = {
    --   "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
    --   "Format",
    -- },
    { "<leader>ci", "<cmd>LspInfo<cr>", desc = "Info" },
    -- ["<leader>lj"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
    {
      "<leader>uh",
      function()
        require("user.lspconfig").toggle_inlay_hints()
      end,
      desc = "Hints",
    },
    -- ["<leader>lk"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
    {
      "<leader>cA",
      function()
        vim.lsp.codelens.run()
      end,
      desc = "CodeLens Action",
    },
    -- {"<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
    {
      "<leader>cr",
      function()
        vim.lsp.buf.rename()
      end,
      desc = "Rename",
    },
    { "<leader>co", "<cmd>VtsExec organize_imports<cr>", desc = "Organize Imports (vtsls)" },
    { "<leader>cR", "<cmd>VtsExec remove_unused_imports<cr>", desc = "Remove Unused Imports (vtsls)" },
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
    "yamlls",
    "gopls",
    "jdtls",
    "lemminx"
  }

  local diagnostic_config = {
    signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.HINT] = "",
          [vim.diagnostic.severity.INFO] = "",
        },
        numhl = {
          [vim.diagnostic.severity.WARN] = "WarningMsg",
          [vim.diagnostic.severity.ERROR] = "ErrorMsg",
          [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
          [vim.diagnostic.severity.HINT] = "DiagnosticHint",
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

  vim.diagnostic.config(diagnostic_config)

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

    -- if server == "lua_ls" then
    --   require("neodev").setup {}
    -- end

    if server == "jdtls" then
      require("java").setup {
        -- Your custom jdtls settings goes here
      }
    end

    lspconfig[server].setup(opts)
  end
end

return M
