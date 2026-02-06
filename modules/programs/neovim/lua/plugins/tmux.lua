require("lze").load({
	{
		"tmux.nvim",
		event = "DeferredUIEnter",
		after = function()
			require("tmux").setup({})
		end,
	},
})
