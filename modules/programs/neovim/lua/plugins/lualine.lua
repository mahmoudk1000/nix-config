require("lze").load({
	{
		"lualine.nvim",
		event = "DeferredUIEnter",
		after = function()
			require("lualine").setup({
				options = {
					theme = {
						normal = { a = "LuaLineNormalA", b = "LuaLineNormalB", c = "LuaLineNormalC" },
						insert = { a = "LuaLineInsertA" },
						visual = { a = "LuaLineVisualA" },
						replace = { a = "LuaLineReplaceA" },
					},
					icons_enabled = true,
					always_divide_middle = true,
					globalstatus = true,
					component_separators = { left = " ", right = " " },
					section_separators = { right = " ", left = " " },
					disabled_filetypes = {
						statusline = { "alpha", "NvimTree" },
					},
					refresh = {
						statusline = 1000,
					},
				},
				sections = {
					lualine_a = {
						{ "mode", icon = " " },
					},
					lualine_b = {},
					lualine_c = {
						{ "filename", path = 4 },
						{ "branch", icon = "" },
					},
					lualine_x = {
						{
							"diagnostics",
							sources = { "nvim_diagnostic" },
							colored = true,
							symbols = { error = "󰅚 ", warn = " ", info = " ", hint = "󰛩 " },
						},
						"diff",
						{
							"filetype",
							icons_enabled = false,
							fmt = function(str)
								return string.upper(str)
							end,
						},
						{
							function()
								local cur = vim.fn.line(".")
								local total = vim.fn.line("$")
								if cur == 1 then
									return string.format("Top/%d", total)
								elseif cur == total then
									return string.format("Bot/%d", total)
								else
									return string.format("%d/%d", cur, total)
								end
							end,
						},
					},
					lualine_y = {},
					lualine_z = {},
				},
				extensions = {
					"fugitive",
					"toggleterm",
					"nvim-tree",
				},
			})
		end,
	},
})
