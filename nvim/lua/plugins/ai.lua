require("avante_lib").load()
require("avante").setup({
    provider = "copilot",
})

-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3

require("copilot").setup({})
