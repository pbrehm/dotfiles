local M = {

  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}

function M.config()
  require("refactoring").setup()
end

M.keys = {
  {
    "<leader>rr",
    function()
      require("refactoring").select_refactor()
    end,
    mode = { "n", "x" },
    desc = "Refactor Menu",
  },
  {
    "<leader>re",
    function()
      require("refactoring").refactor "Extract Function"
    end,
    mode = { "x" },
    desc = "Extract Function",
  },
  {
    "<leader>rf",
    function()
      require("refactoring").refactor "Extract Function To File"
    end,
    mode = { "x" },
    desc = "Extract Function To File",
  },
  {
    "<leader>rv",
    function()
      require("refactoring").refactor "Extract Variable"
    end,
    mode = { "x" },
    desc = "Extract Variable",
  },
  {
    "<leader>rI",
    function()
      require("refactoring").refactor "Inline Function"
    end,
    mode = { "n" },
    desc = "Inline Function",
  },
  {
    "<leader>ri",
    function()
      require("refactoring").refactor "Inline Variable"
    end,
    mode = { "n", "x" },
    desc = "Inline Variable",
  },
  {
    "<leader>rb",
    function()
      require("refactoring").refactor "Extract Block"
    end,
    mode = "n",
    desc = "Extract Block",
  },
  {
    "<leader>rbf",
    function()
      require("refactoring").refactor "Extract Block To File"
    end,
    mode = "n",
    desc = "Extract Block To File",
  },
}

return M
