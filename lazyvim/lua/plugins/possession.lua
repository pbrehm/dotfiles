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
}
