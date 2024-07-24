local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = { { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true } },
}

function M.config()
  local wk = require "which-key"
  local builtin = require "telescope.builtin"
  wk.add {
    { "<leader>sb", builtin.buffers, desc = "Telescope Find Buffer" },
    -- {"<leader>fb", "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    -- {"<leader>fc", "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    -- {"<leader>ff", "<cmd>Telescope find_files<cr>", "Find files" },
    {
      "<leader><leader>",
      function()
        builtin.find_files { find_command = { "rg", "--files", "--hidden", "-g", "!.git" } }
      end,
      desc = "Find files",
    },
    -- {"<leader>fp", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
    -- {"<leader>ft", "<cmd>Telescope live_grep<cr>", "Find Text" },
    { "<leader>/", builtin.live_grep, desc = "Find text in all files" },
    { "<leader>sh", builtin.help_tabs, desc = "Help" },
    { "<leader>sl", builtin.resume, desc = "Last Search" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent File" },
    { "<leader>sk", builtin.keymaps, desc = "Key Maps" },
    { "<leader>sm", builtin.marks, desc = "Marks" },
    { "<leader>s/", builtin.current_buffer_fuzzy_find, desc = "[S]earch [/] in Open Buffer" },
  }

  local icons = require "user.resources.icons"
  local actions = require "telescope.actions"

  require("telescope").setup {
    defaults = {

      layout_config = {
        horizontal = {
          -- width = 0.8,
          height = 0.6,
          prompt_position = "top",
          -- preview_cutoff = 120,
        },
      },
      sorting_strategy = "ascending",
      prompt_prefix = icons.ui.Telescope .. " ",
      selection_caret = icons.ui.Forward .. " ",
      entry_prefix = "   ",
      initial_mode = "insert",
      selection_strategy = "reset",
      path_display = { "smart" },
      color_devicons = true,
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!.git/",
      },

      -- mappings = {
      -- lots of stuff here that can be cleaned up eventually.
      -- default mapping below
      -- ["<C-n>"] = actions.move_selection_next,
      -- ["<C-p>"] = actions.move_selection_previous,
      --
      -- ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
      -- ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
      --
      -- actions.move_selection_next and actions.move_selection_worse are opposite when promt is on bottom
      -- make next and previous use same actions to be consistent
      -- I expect tab and <C-n> to go the same direction
      -- i = {
      --   ["<C-n>"] = actions.move_selection_worse,
      --   ["<C-p>"] = actions.move_selection_better,
      -- },
      -- normally these actions use actions.move_selection_worse and actions.move_selection_better
      -- however when the normal horizontal layout is used with the prompt at the bottom, better and worse is opposite of next and previous
      -- to make this more consistent, remap <Tab> and <S-Tab> to use next and previous

      -- i = {
      --   ["<Tab>"] = actions.toggle_selection + actions.move_selection_next,
      --   ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_previous,
      --   -- ["<Tab>"] = actions.toggle_selection,
      --   -- ["<S-Tab>"] = actions.toggle_selection,
      -- },
      -- n = {
      --   ["<Tab>"] = actions.toggle_selection + actions.move_selection_next,
      --   ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_previous,
      --   -- ["<Tab>"] = actions.toggle_selection,
      --   -- ["<S-Tab>"] = actions.toggle_selection,
      --   }
      -- },
    },
    pickers = {
      -- live_grep = {
      --   theme = "ivy",
      -- },

      -- grep_string = {
      --   theme = "ivy",
      -- },

      -- find_files = {
      --   theme = "ivy",
      -- --   previewer = false,
      -- },

      buffers = {
        -- theme = "ivy",
        -- initial_mode = "normal",
        mappings = {
          i = {
            ["<C-d>"] = actions.delete_buffer,
          },
          n = {
            ["dd"] = actions.delete_buffer,
          },
        },
      },

      planets = {
        show_pluto = true,
        show_moon = true,
      },

      colorscheme = {
        enable_preview = true,
      },

      lsp_references = {
        -- theme = "dropdown",
        -- initial_mode = "normal",
      },

      lsp_definitions = {
        -- theme = "dropdown",
        -- initial_mode = "normal",
      },

      lsp_declarations = {
        -- theme = "dropdown",
        -- initial_mode = "normal",
      },

      lsp_implementations = {
        -- theme = "dropdown",
        -- initial_mode = "normal",
      },
    },
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      },
    },
  }
end

return M
