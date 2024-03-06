local M = {
  "ThePrimeagen/harpoon",
  event = "VeryLazy",
  branch = "harpoon2",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
}

function M.config()
  local harpoon = require "harpoon"
  harpoon:setup {}

  vim.keymap.set("n", "<s-m>", function()
    harpoon:list():append()
    vim.notify "󱡅  marked file"
  end)
  vim.keymap.set("n", "<leader>h", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
  end, { desc = "Harpoon toggle ui" })

  vim.keymap.set("n", "<leader>1", function()
    harpoon:list():select(1)
  end, { desc = "Harpoon select 1" })
  vim.keymap.set("n", "<leader>2", function()
    harpoon:list():select(2)
  end, { desc = "Harpoon select 2" })
  vim.keymap.set("n", "<leader>3", function()
    harpoon:list():select(3)
  end, { desc = "Harpoon select 3" })
  vim.keymap.set("n", "<leader>4", function()
    harpoon:list():select(4)
  end, { desc = "Harpoon select 4" })
  vim.keymap.set("n", "<leader>5", function()
    harpoon:list():select(5)
  end, { desc = "Harpoon select 5" })
  vim.keymap.set("n", "<leader>6", function()
    harpoon:list():select(6)
  end, { desc = "Harpoon select 6" })
  vim.keymap.set("n", "<leader>7", function()
    harpoon:list():select(7)
  end, { desc = "Harpoon select 7" })
  vim.keymap.set("n", "<leader>8", function()
    harpoon:list():select(8)
  end, { desc = "Harpoon select 8" })
  vim.keymap.set("n", "<leader>9", function()
    harpoon:list():select(9)
  end, { desc = "Harpoon select 9" })

  -- Toggle previous & next buffers stored within Harpoon list
  -- vim.keymap.set("n", "<C-S-P>", function()
  --   harpoon:list():prev()
  -- end)
  -- vim.keymap.set("n", "<C-S-N>", function()
  --   harpoon:list():next()
  -- end)
end

return M
