require("conform").setup({
	formatters_by_ft = {
		["*"] = { "codespell" },
		lua = { "stylua" },
		python = { "ruff_format", "ruff_fix" },
		json = { "jq" },
		markdown = { "markdownlint" },
		nix = { "nixfmt" },
		sh = { "shfmt" },
		zsh = { "shfmt" },
		toml = { "taplo" },
		terraform = { "terraform_fmt", "tofu_fmt" },
		tf = { "terraform_fmt", "tofu_fmt" },
		yaml = { "yamlfmt" },
		tex = { "latexindent" },
	},
	format_on_save = {
		timeout = 500,
		lsp_fallback = true,
	},
})
