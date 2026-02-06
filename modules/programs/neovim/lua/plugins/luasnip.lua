require("lze").load({
	{
		"luasnip",
		on_plugin = { "blink.cmp" },
		after = function()
			local luasnip = require("luasnip")
			luasnip.config.set_config({
				history = true,
				updateevents = "TextChanged,TextChangedI",
				enable_autosnippets = true,
			})
		end,
	},
})
