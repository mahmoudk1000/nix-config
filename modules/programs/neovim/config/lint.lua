require("lint").linters_by_ft = {
	zsh = { "shellcheck" },
	sh = { "shellcheck" },
	python = { "ruff" },
	markdown = { "markdownlint" },
	yaml = { "yamllint" },
	dockerfile = { "hadolint" },
	terraform = { "tfsec", "trivy", "terraform_validate", "tflint" },
	tf = { "tfsec", "trivy", "terraform_validate", "tflint" },
	make = { "checkmake" },
	ansible = { "ansible_lint" },
	nix = { "deadnix", "nix", "statix" },
	tex = { "chktex" },
	go = { "golangcilint" },
}

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = vim.api.nvim_create_augroup("lint", { clear = true }),
	callback = function()
		require("lint").try_lint()
	end,
})
