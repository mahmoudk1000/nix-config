require("lze").load({
	{
		"blink-pairs",
		on_plugin = { "blink.cmp" },
		after = function()
			require("blink-pairs").setup({
				mappings = {
					enabled = true,
					disabled_filetypes = {},
					pairs = {},
				},
				highlights = {
					enabled = true,
					groups = {
						"BlinkPairsPurple",
						"BlinkPairsYellow",
						"BlinkPairsCyan",
					},
					matchparen = {
						enabled = true,
						group = "BlinkPairsMatchParen",
					},
				},
				debug = false,
			})
		end,
	},
})
