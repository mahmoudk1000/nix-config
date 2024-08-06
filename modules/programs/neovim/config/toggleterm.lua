require("toggleterm").setup({
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,
	hide_numbers = true,
	open_mapping = [[<c-\>]],
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = "1",
	start_in_insert = true,
	persist_size = true,
	persist_mode = false,
	close_on_exit = true,
	auto_scroll = true,
	shell = vim.o.shell,
	direction = "horizontal",
	highlights = {
		Normal = { link = "Normal" },
		NormalFloat = { link = "NormalFloat" },
		WinSeparator = { link = "WinSeparator" },
		FloatBorder = { link = "FloatBorder" },
	},
	float_opts = {
		border = "single",
	},
})
