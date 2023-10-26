return {
  {
    "nvim-lualine/lualine.nvim",
    -- disable clock since tmux has it
    opts = {
      options = {
        -- section_separators = { left = "█", right = "" },
        section_separators = { left = "█", right = "█" },
        component_separators = "|",
      },
      sections = {
        lualine_z = {},
      },
    },
  },
}
