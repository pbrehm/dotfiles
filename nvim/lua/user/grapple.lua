local M = {
  "cbochs/grapple.nvim",
  opts = {
    scope = "git", -- also try out "git_branch"
    icons = false, -- setting to "true" requires "nvim-web-devicons"
    status = false,
  },
  keys = {
    { "<s-m>", "<cmd>Grapple toggle<cr>", desc = "[M]ark a file" },
    { "<leader>m", "<cmd>Grapple toggle_tags<cr>", desc = "Toggle [m]arks menu" },

    { "<leader>1", "<cmd>Grapple select index=1<cr>", desc = "Select marked file - 1" },
    { "<leader>2", "<cmd>Grapple select index=2<cr>", desc = "Select marked file - 2" },
    { "<leader>3", "<cmd>Grapple select index=3<cr>", desc = "Select marked file - 3" },
    { "<leader>4", "<cmd>Grapple select index=4<cr>", desc = "Select marked file - 4" },
    { "<leader>5", "<cmd>Grapple select index=5<cr>", desc = "Select marked file - 5" },
    { "<leader>6", "<cmd>Grapple select index=6<cr>", desc = "Select marked file - 6" },
    { "<leader>7", "<cmd>Grapple select index=7<cr>", desc = "Select marked file - 7" },
    { "<leader>8", "<cmd>Grapple select index=8<cr>", desc = "Select marked file - 8" },
    { "<leader>9", "<cmd>Grapple select index=9<cr>", desc = "Select marked file - 9" },

    -- { "<c-s-p>", "<cmd>Grapple cycle backward<cr>", desc = "Go to previous tag" },
    -- { "<c-s-n>", "<cmd>Grapple cycle forward<cr>", desc = "Go to next tag" },
  },
}

return M
