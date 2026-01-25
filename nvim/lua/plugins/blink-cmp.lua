local blink = require("blink.cmp")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

local winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel"

blink.setup({
	snippets = {
		preset = "luasnip", -- for bug
		-- https://github.com/Saghen/blink.cmp/issues/1805
		active = function()
			if luasnip.in_snippet() and not blink.is_visible() then
				return true
			else
				if not luasnip.in_snippet() and vim.fn.mode() == "n" then
					luasnip.unlink_current()
				end
				return false
			end
		end,
	},
	cmdline = { enabled = true },
	sources = {
		default = { "lsp", "path", "snippets", "buffer", "omni" },
		providers = {
			avante = {
				module = "blink-cmp-avante",
				name = "Avante",
				opts = {
					-- options for blink-cmp-avante
				},
			},
		},
	},
	signature = {
		enabled = true,
		window = { border = "single" },
	},
	completion = {
		menu = {
			auto_show = function(ctx)
				return ctx ~= "cmdline"
			end,
			winhighlight = winhighlight,
			border = "single",
			draw = {
				treesitter = { "lsp" },
				columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "source_name" } },
			},
		},
		ghost_text = { enabled = true },
		list = {
			selection = {
				preselect = true,
				auto_insert = false,
			},
		},
		documentation = {
			auto_show = true,
			window = {
				border = "single",
				winhighlight = winhighlight,
			},
			auto_show_delay_ms = 500,
		},
	},
	keymap = {
		["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
		["<C-e>"] = { "hide" },
		["<C-y>"] = { "select_and_accept" },

		["<Up>"] = { "select_prev", "fallback" },
		["<Down>"] = { "select_next", "fallback" },
		["<C-p>"] = { "select_prev", "fallback_to_mappings" },
		["<C-n>"] = { "select_next", "fallback_to_mappings" },

		["<C-b>"] = { "scroll_documentation_up", "fallback" },
		["<C-f>"] = { "scroll_documentation_down", "fallback" },

		["<Tab>"] = { "snippet_forward", "fallback" },
		["<S-Tab>"] = { "snippet_backward", "fallback" },

		["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
	},
})
