-- Possession keymaps
-- Define a function to get the directory name from the current working directory (CWD)
function GetCWDName()
  local cwd = vim.fn.getcwd()
  local parts = vim.fn.split(cwd, "/")
  return parts[#parts]
end

return {
  { "folke/persistence.nvim", enabled = false },
  -- {
  --   "rmagatti/auto-session",
  --   opts = {
  --     log_level = "error",
  --     auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
  --   },
  -- },
  {
    "jedrzejboczar/possession.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      commands = {
        save = "SSave",
        load = "SLoad",
        delete = "SDelete",
        list = "SList",
      },
      autosave = {
        current = true,
      },
      telescope = {
        list = {
          default_action = "load",
          mappings = {
            save = { n = "<c-s>", i = "<c-s>" },
            load = { n = "<c-l>", i = "<c-l>" },
            delete = { n = "<c-d>", i = "<c-d>" },
            rename = { n = "<c-r>", i = "<c-r>" },
          },
        },
      },
    },
    keys = {
      {
        "<leader>Ss",
        function()
          vim.cmd('execute "SSave ' .. GetCWDName() .. '"')
        end,
        desc = "SSave CWD",
      },
      {
        "<leader>Sl",
        function()
          vim.cmd('execute "SLoad ' .. GetCWDName() .. '"')
        end,
        desc = "SLoad CWD",
      },
      {
        "<leader>St",
        function()
          require("telescope").extensions.possession.list()
        end,
        desc = "Session load via telescope",
      },
    },
  },
}
