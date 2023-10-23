return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    event_handlers = {
      {
        event = "vim_buffer_enter",
        handler = function()
          if vim.bo.filetype == "neo-tree" then
            vim.cmd([[setlocal number relativenumber cursorlineopt=number]])
          end
        end,
      },
    },
  },
}
