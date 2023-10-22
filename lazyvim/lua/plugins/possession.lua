return {
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
  },
}
