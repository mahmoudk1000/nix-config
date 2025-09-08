require("blink.cmp").setup({
	snippets = { preset = "luasnip" },
	sources = {
		default = { "lsp", "path", "snippets", "buffer", "copilot" },
		providers = {
			copilot = {
				name = "copilot",
				module = "blink-copilot",
				score_offset = 100,
				async = true,
			},
			buffer = {
				opts = {
					get_bufnrs = function()
						return vim.tbl_filter(function(bufnr)
							return vim.bo[bufnr].buftype == ""
						end, vim.api.nvim_list_bufs())
					end,
				},
			},
		},
	},
	keymap = {
		preset = "enter",
		["<Tab>"] = {
			function(cmp)
				if cmp.is_menu_visible() then
					return require("blink.cmp").select_next()
				elseif cmp.snippet_active() then
					return cmp.snippet_forward()
				end
			end,
			"fallback",
		},
		["<S-Tab>"] = {
			function(cmp)
				if cmp.is_menu_visible() then
					return require("blink.cmp").select_prev()
				elseif cmp.snippet_active() then
					return cmp.snippet_backward()
				end
			end,
			"fallback",
		},
	},
	appearance = {
		kind_icons = {
			Text = "󰉿",
			Method = "󰆧",
			Function = "󰊕",
			Constructor = "",
			Field = "󰜢",
			Variable = "󰀫",
			Class = "󰠱",
			Interface = "",
			Module = "",
			Property = "󰜢",
			Unit = "󰑭",
			Value = "󰎠",
			Enum = "",
			Keyword = "󰌋",
			Snippet = "",
			Color = "󰏘",
			File = "󰈙",
			Reference = "󰈇",
			Folder = "󰉋",
			EnumMember = "",
			Constant = "󰏿",
			Struct = "󰙅",
			Event = "",
			Operator = "󰆕",
			Copilot = "󰚩",
			TypeParameter = "",
		},
	},
	completion = {
		keyword = {
			range = "prefix",
		},
		list = {
			selection = {
				preselect = false,
				auto_insert = true,
			},
		},
		accept = {
			auto_brackets = {
				enabled = true,
				override_brackets_for_filetypes = {
					tex = { "{", "}" },
				},
			},
		},
		menu = {
			min_width = 20,
			auto_show = true,
			border = "rounded",
			winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
			draw = {
				columns = {
					{ "label", "label_description", gap = 1 },
					{ "kind_icon" },
					{ "source_name" },
				},
			},
		},
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 100,
			update_delay_ms = 50,
			window = {
				max_width = math.min(80, vim.o.columns),
				border = "rounded",
			},
		},
	},
	cmdline = {
		completion = {
			menu = {
				auto_show = true,
			},
			ghost_text = {
				enabled = false,
			},
			list = {
				selection = {
					preselect = false,
					auto_insert = true,
				},
			},
		},
	},
	signature = {
		enabled = true,
		window = {
			border = "rounded",
			scrollbar = false,
		},
	},
})
