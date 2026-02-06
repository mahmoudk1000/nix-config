require("lze").load({
	{
		"incline.nvim",
		event = { "DeferredUIEnter" },
		after = function(_)
			require("incline").setup({
				highlight = {
					groups = {
						InclineNormal = { default = true, group = "InclineNormal" },
						InclineNormalNC = { default = true, group = "InclineNormalNC" },
					},
				},
				window = { margin = { vertical = 0, horizontal = 1 } },
				render = function(props)
					local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
					local icon, color = require("nvim-web-devicons").get_icon_color(filename)
					return { { icon, guifg = color }, { icon and " " or "" }, { filename } }
				end,
				hide = {
					cursorline = false,
					focused_win = false,
					only_win = true,
				},
			})
		end,
	},
})
