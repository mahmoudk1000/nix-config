require("conform").setup({
	formatters_by_ft = {
		["*"] = { "codespell" },
		["_"] = { "trim_whitespace" },
		lua = { "stylua" },
		python = { "ruff_format", "ruff_fix" },
		json = { "jq" },
		markdown = { "markdownlint" },
		nix = { "nixfmt" },
		bash = { "shfmt" },
		sh = { "shfmt" },
		zsh = { "shfmt" },
		terraform = { "terraform_fmt", "tofu_fmt" },
		tf = { "terraform_fmt", "tofu_fmt" },
		yaml = { "yamlfix" },
		tex = { "latexindent" },
		go = { "gofmt", "goimports-reviser", "golines" },
	},
	format_on_save = {
		timeout_ms = 1000,
		lsp_format = "fallback",
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
