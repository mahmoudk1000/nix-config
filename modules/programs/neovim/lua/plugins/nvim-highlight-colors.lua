require("lze").load({
	{
		"nvim-highlight-colors",
		event = "DeferredUIEnter",
		after = function()
			require("nvim-highlight-colors").setup({})
		end,
	},
})
