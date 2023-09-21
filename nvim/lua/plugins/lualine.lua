return {
  {
    "nvim-lualine/lualine.nvim",
    -- disable clock since tmux has it
    opts = {
      sections = {
        lualine_z = {},
      },
    },
  },
}
