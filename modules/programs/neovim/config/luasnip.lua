require("luasnip").config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
})
require("luasnip/loaders/from_vscode").lazy_load()
