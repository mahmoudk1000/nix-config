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
		component_separators = { left = "|", right = "|" },
		section_separators = { right = "", left = "" },
		disabled_filetypes = {
			statusline = { "alpha", "NvimTree" },
		},
		refresh = {
			statusline = 1000,
		},
	},
	sections = {
		lualine_a = {
			{ "mode", icons_enabled = true, icon = "" },
		},
		lualine_b = {
			{ "branch", icon = "" },
			{ "filename", file_status = true },
		},
		lualine_c = {
			"diff",
		},
		lualine_x = {
			{ "diagnostics", sources = { "nvim_diagnostic" } },
		},
		lualine_y = {
			{
				icon = "󱉭 ",
				color = function()
					local hl = vim.api.nvim_get_hl_by_name("Special", true)
					return { fg = string.format("#%06x", hl.foreground) }
				end,
				function()
					return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
				end,
			},
			"progress",
		},
		lualine_z = {
			{ "location", icon = "", padding = { left = 1, right = 1 } },
		},
	},
	extensions = {
		"fugitive",
		"toggleterm",
		"nvim-tree",
	},
})
