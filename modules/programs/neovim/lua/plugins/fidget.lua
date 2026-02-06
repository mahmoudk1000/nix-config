require("lze").load({
	{
		"fidget.nvim",
		on_plugin = { "nvim-lspconfig" },
		after = function()
			require("fidget").setup({
				notification = {
					window = {
						normal_hl = "CursorLineNr",
						winblend = 0,
						border = "none",
						align = "bottom",
					},
				},
			})
		end,
	},
})
