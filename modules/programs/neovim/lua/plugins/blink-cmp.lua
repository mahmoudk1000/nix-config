require("lze").load({
	{
		"blink.cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		after = function()
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
					use_nvim_cmp_as_default = true,
					nerd_font_variant = "mono",
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
					trigger = {
						show_on_trigger_character = true,
						show_on_insert_on_trigger_character = true,
						show_on_x_blocked_trigger_characters = { "'", '"', "(", "{" },
					},
					menu = {
						auto_show = true,
						border = "rounded",
						draw = {
							gap = 1,
							columns = {
								{ "label", "label_description" },
								{ "kind_icon", "kind", gap = 1 },
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
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
})
