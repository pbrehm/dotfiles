return {
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      {
        "<leader>hu",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        desc = "[H]arpoon [U]i",
      },
      {
        "<leader>h1",
        function()
          require("harpoon.ui").nav_file(1)
        end,
        desc = "[H]arpoon nave file [1]",
      },
      {
        "<leader>h2",
        function()
          require("harpoon.ui").nav_file(2)
        end,
        desc = "[H]arpoon nave file [2]",
      },
      {
        "<leader>h3",
        function()
          require("harpoon.ui").nav_file(3)
        end,
        desc = "[H]arpoon nave file [3]",
      },
      {
        "<leader>h4",
        function()
          require("harpoon.ui").nav_file(4)
        end,
        desc = "[H]arpoon nave file [4]",
      },
      {
        "<leader>h5",
        function()
          require("harpoon.ui").nav_file(5)
        end,
        desc = "[H]arpoon nave file [5]",
      },
      {
        "<leader>hm",
        function()
          require("harpoon.mark").add_file()
        end,
        desc = "[H]arpoon [M]ark file",
      },
      {
        "<leader>hn",
        function()
          require("harpoon.ui").nav_next()
        end,
        desc = "[H]arpoon navigate [N]ext",
      },
      {
        "<leader>hp",
        function()
          require("harpoon.ui").nav_prev()
        end,
        desc = "[H]arpoon navigate [P]rev",
      },
    },
  },
}
