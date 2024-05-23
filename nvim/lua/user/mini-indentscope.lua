local M = {

  "echasnovski/mini.indentscope",
}

function M.config()
  require("mini.indentscope").setup {
    symbol = "│",
    -- options = {
    --   indent_at_cursor = false,
    -- },
    draw = {
      delay = 0,
      animation = require("mini.indentscope").gen_animation.none(),
    },
  }
end

function M.init()
  vim.api.nvim_create_autocmd("FileType", {
    pattern = {
      "help",
      "alpha",
      "dashboard",
      "neo-tree",
      "Trouble",
      "trouble",
      "lazy",
      "mason",
      "notify",
      "toggleterm",
      "lazyterm",
      "neotest-summary",
      "neotest-output",
      "neotest-output-panel",
      "DiffviewFiles",
      "Aerial",
      "Outline",
      "Git"
    },
    callback = function()
      vim.b.miniindentscope_disable = true
    end,
  })
end
return M
