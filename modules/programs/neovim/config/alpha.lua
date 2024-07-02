local dashboard = require("alpha.themes.dashboard")

dashboard.section.header = {
	type = "text",
	val = {
		[[  ██████   █████ █████   █████ █████ ██████   ██████ ]],
		[[ ░░██████ ░░███ ░░███   ░░███ ░░███ ░░██████ ██████  ]],
		[[  ░███░███ ░███  ░███    ░███  ░███  ░███░█████░███  ]],
		[[  ░███░░███░███  ░███    ░███  ░███  ░███░░███ ░███  ]],
		[[  ░███ ░░██████  ░░███   ███   ░███  ░███ ░░░  ░███  ]],
		[[  ░███  ░░█████   ░░░█████░    ░███  ░███      ░███  ]],
		[[  █████  ░░█████    ░░███      █████ █████     █████ ]],
		[[ ░░░░░    ░░░░░      ░░░      ░░░░░ ░░░░░     ░░░░░  ]],
		[[ ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ ]],
	},
	opts = {
		hl = "Keyword",
		position = "center",
	},
}

dashboard.section.buttons = {
	type = "group",
	val = {
		dashboard.button("n f", "  New File", ":ene <BAR> startinsert<CR>"),
		dashboard.button("f f", "  Find File", ":Telescope find_files<CR>"),
		dashboard.button("b k", "  Bookmarks", ":Telescope marks<CR>"),
		dashboard.button("q q", "  Quit Nvim", ":qa<CR>"),
	},
	opts = {
		spacing = 1,
		-- hl_shortcut = "Special",
		position = "center",
	},
}

dashboard.section.footer = {
	type = "text",
	val = "Programming isn't about what you know; it's about what you can figure out.",
	opts = {
		hl = "Comment",
		position = "center",
	},
}

require("alpha").setup({
	layout = {
		{ type = "padding", val = vim.fn.max({ 2, vim.fn.floor(vim.fn.winheight(0) * 0.33) }) },
		dashboard.section.header,
		{ type = "padding", val = 3 },
		dashboard.section.buttons,
		{ type = "padding", val = 3 },
		dashboard.section.footer,
	},
	opts = {
		margin = 3,
	},
})

vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
