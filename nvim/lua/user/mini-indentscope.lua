local M = {

  "echasnovski/mini.indentscope",
}

function M.config()
  require('mini.indentscope').setup({
    symbol = "│",
    -- options = {
    --   indent_at_cursor = false,
    -- },
    draw = {
      delay = 0,
      animation = require('mini.indentscope').gen_animation.none()
    }
  })
end

return M
