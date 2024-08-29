require("conform").setup({
	formatters_by_ft = {
		["*"] = { "codespell" },
		["_"] = { "trim_whitespace" },
		lua = { "stylua" },
		python = { "ruff_format", "ruff_fix" },
		json = { "jq" },
		markdown = { "markdownlint" },
		nix = { "nixfmt" },
		sh = { "shfmt" },
		zsh = { "shfmt" },
		terraform = { "terraform_fmt", "tofu_fmt" },
		tf = { "terraform_fmt", "tofu_fmt" },
		yaml = { "yamlfix" },
		tex = { "latexindent" },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
