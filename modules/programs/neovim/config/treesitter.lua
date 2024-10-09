require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.powershell = {
	install_info = {
		url = "https://github.com/airbus-cert/tree-sitter-powershell",
		files = { "src/parser.c", "src/scanner.c" },
	},
	filetype = "ps1",
	used_by = { "psm1", "psd1", "pssc", "psxml", "cdxml" },
}
