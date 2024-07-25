local M = {
  "gbprod/yanky.nvim",
  desc = "Better Yank/Paste",
  lazy = false,
  opts = {
    highlight = { timer = 150 },
  },
  keys = {
    {
      "<leader>sp",
      function()
        require("telescope").extensions.yank_history.yank_history {}
      end,
      desc = "Open Yank History",
    },
  },
}

-- default telescope mappings
-- require("yanky").setup {
--   picker = {
--     telescope = {
--       mappings = {
--         default = mapping.put "p",
--         i = {
--           ["<c-g>"] = mapping.put "p",
--           ["<c-k>"] = mapping.put "P",
--           ["<c-x>"] = mapping.delete(),
--           ["<c-r>"] = mapping.set_register(utils.get_default_register()),
--         },
--         n = {
--           p = mapping.put "p",
--           P = mapping.put "P",
--           d = mapping.delete(),
--           r = mapping.set_register(utils.get_default_register()),
--         },
--       },
--     },
--   },
-- }

return M
