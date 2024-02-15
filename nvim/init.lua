require "user.config.launch"
require "user.config.options"
require "user.config.keymaps"
require "user.config.autocmds"
spec "user.colorschemes.kanagawa"
-- spec "user.colorschemes.darkplus"

spec "user.neotree"
spec "user.whichkey"
spec "user.treesitter"

-- TODO:setup following plugins in this order
-- Mason
-- LSP

require "user.config.lazy"
