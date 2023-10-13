return {
  {
    "L3MON4D3/LuaSnip",
    -- dependencies = {
    -- Example of how to add vscode snippets
    --   "rafamadriz/friendly-snippets",
    -- },
    config = function()
      -- andys8/vscode-jest-snippets has "source" = "source.js" in every snippet and that stops it from working
      -- the following is a copy of the repo I made that removes this
      require("luasnip.loaders.from_vscode").lazy_load({ paths = "./snippets/vscode-jest-snippets-custom" })
    end,
  }
}
