require "user.config.launch"
require "user.config.options"
require "user.config.keymaps"
require "user.config.autocmds"
spec "user.colorschemes.kanagawa"
-- spec "user.colorschemes.darkplus"

spec "user.neotree"
spec "user.whichkey"
spec "user.treesitter"
spec "user.treesitter-context"

spec "user.mason"
spec "user.lspconfig"
spec "user.conform"
spec "user.cmp"

spec "user.indentline"
spec "user.mini-indentscope"
spec "user.illuminate"
-- spec "user.autopairs"
spec "user.trouble"
spec "user.matchup"
spec "user.spectre"
spec "user.todo-comments"
spec "user.mini-surround"

-- fancy ui
-- spec "user.dressing"
-- spec "user.noice"

-- spec "user.fidget"

spec "user.lualine"
spec "user.gitsigns"
spec "user.ufo"
spec "user.comment"
spec "user.telescope"
spec "user.test"

spec "user.persistence"
spec "user.dashboard-nvim"
spec "user.harpoon"
spec "user.undo-tree"
spec "user.gitdiff"

spec "user.dap"

-- spec "user.nvim-window"


require "user.config.lazy"
