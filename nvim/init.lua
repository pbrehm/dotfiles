require "user.config.launch"
require "user.config.options"
require "user.config.keymaps"
require "user.config.autocmds"

-- treesitter
spec "user.treesitter"
spec "user.treesitter-context"

-- lsp
spec "user.mason"
spec "user.lspconfig"
spec "user.conform"
spec "user.cmp"

-- ui
spec "user.colorschemes.kanagawa"
-- spec "user.colorschemes.rosepine"
-- spec "user.colorschemes.github"
-- spec "user.colorschemes.midnight"
-- spec "user.colorschemes.darkplus"
-- spec "user.colorschemes.moonfly"
spec "user.neotree"
spec "user.nvim-lsp-file-operations" -- gives neo tree lsp rename integration. must be loaded after neotree
spec "user.indentline"
-- spec "user.mini-indentscope"
spec "user.mini-icons"
spec "user.illuminate"
spec "user.whichkey"
spec "user.todo-comments"
spec "user.lualine"
spec "user.colorizer"

-- editor
spec "user.telescope"
spec "user.trouble"
spec "user.matchup"
spec "user.spectre"
spec "user.mini-surround"
spec "user.ufo"
spec "user.comment"
spec "user.yanky"
-- spec "user.autopairs"
-- spec "user.harpoon" -- when you open nvim for the first time and use harpoon to enter a file, the folds do not work
spec "user.grapple" -- replaced harpoon.
-- spec "user.navbuddy" -- makes cursor black. on nightly. Probably an nui thing
spec "user.persistence"
spec "user.dashboard-nvim"
spec "user.bufdel"
spec "user.undo-tree"
spec "user.mini-ai"
spec "user.fidget"
spec "user.bqf"
spec "user.refactoring"
-- spec "user.aerial"
spec "user.outline"
spec "user.oil"
spec "user.dressing"
-- spec "user.noice"
-- spec "user.tabby" -- nice but not needed at this time. basic configure from launch.nvim
-- spec "user.nvim-window"
spec "user.markdown-preview"

-- git
spec "user.gitsigns"
spec "user.gitdiff"
spec "user.lazygit"

-- test
spec "user.test"
spec "user.dap"

require "user.config.lazy"
