return {
  {
    "folke/which-key.nvim",
    opts = {
      icons = {
        separator = "", -- altarnative because regular italic ones looks super fat
      },
      defaults = {
        ["<leader>h"] = { name = "+harpoon" },
        ["<leader>S"] = { name = "+Session"}
      },
    },
  },
}
