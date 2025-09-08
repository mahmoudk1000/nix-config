require("blink.pairs").setup({
	mappings = {
		enabled = true,
		disabled_filetypes = {},
		pairs = {},
	},
	highlights = {
		enabled = true,
		groups = {
			"BlinkPairsYellow",
			"BlinkPairsPurple",
			"BlinkPairsCyan",
		},
		matchparen = {
			enabled = true,
			group = "BlinkPairsMatchParen",
		},
	},
	debug = false,
})
