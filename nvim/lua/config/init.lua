-- options
-- global option keep this at top
require("config.options")

-- require("coco.plugins")
require("plugins.alpha")
require("plugins.flash-nvim")
require("plugins.todo-comments")
require("plugins.mini-pairs")
require("plugins.fugitive")
require("plugins.none-ls")
require("plugins.treesitter")
require("plugins.auto-session")
require("plugins.gitsings")
require("plugins.nvim-tree")
require("plugins.undotree")
require("plugins.bufferline-nvim")
require("plugins.harpoon2")
require("plugins.sniprun")
require("plugins.which-key")
require("plugins.blink-cmp")
require("plugins.lsp")
require("plugins.telescope")
require("plugins.debugging")
require("plugins.vim-test")
require("plugins.trouble")

require("utils.compiler")
require("snippets.snip")

-- files
require("config.keymaps")
require("config.auto-commands")

require("config.small")
