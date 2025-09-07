require("bufferline").setup({
	options = {
		mode = "buffers",
		numbers = "none",
		offsets = {
			{
				filetype = "NvimTree",
				text = "󰉓  NvimTree",
				-- text = function()
				-- 	return vim.fn.fnamemodify(vim.fn.getcwd(), ":~") --(".", ":p:h:t")
				-- end,
				highlight = "BufferLineBufferSelected",
				text_align = "center",
			},
		},
		indicator = { style = "none" },
		separator_style = "thin",
		buffer_close_icon = "✘",
		modified_icon = "",
		close_icon = "✘",
		show_close_icon = true,
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 20,
		max_prefix_length = 13,
		tab_size = 20,
		show_tab_indicators = true,
		enforce_regular_tabs = false,
		show_buffer_close_icons = true,
		color_icons = true,
		show_buffer_icons = true,
		get_element_icon = function(element)
			local icon, _ = require("nvim-web-devicons").get_icon_by_filetype(element.filetype, { default = false })

			return icon, "BufferLineIcon"
		end,
		diagnostics = false, -- OR: | "nvim_lsp"
		diagnostics_indicator = function(count, level)
			local icon = level:match("error") and "" or ""
			return " " .. icon .. " " .. count
		end,
	},
})
