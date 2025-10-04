-- Plugin setup
require("nvim-surround").setup({})
require("rainbow-delimiters.setup").setup({})
require("ibl").setup()
require("lualine").setup({
	icons_enabled = true,
})
require("fidget").setup({
	progress = {
		display = {
			progress_icon = { pattern = "dots", period = 1 },
		},
	},
})

--colorizer
require("colorizer").setup({})
-- Theme configuration
require("onedark").load()
-- vim.cmd.colorscheme("tokyonight")

-- Fix WinBar color settings
vim.api.nvim_set_hl(0, "WinBar", {
	bold = true, -- Keeps the bold attribute
	bg = "NONE", -- Removes background color
	fg = "NONE", -- Removes foreground color
})
vim.api.nvim_set_hl(0, "WinBarNC", {
	bold = true, -- Keeps the bold attribute
	bg = "NONE", -- Removes background color
	fg = "NONE", -- Removes foreground color
})

require("direnv").setup({
	autoload_direnv = true,
})
