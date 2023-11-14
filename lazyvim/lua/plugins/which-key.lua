return {
  {
    "folke/which-key.nvim",
    opts = {
      icons = {
        separator = "", -- altarnative because regular italic ones looks super fat
      },
      defaults = {
        ["<leader>h"] = { name = "+[h]arpoon" },
        ["<leader>S"] = { name = "+[S]ession"},
        -- ["<leader>r"] = { name = "+[r]efactor"}
      },
    },
  },
}
