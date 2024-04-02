require("lint").linters.deadnix = {
	name = "deadnix",
	cmd = "deadnix",
	stdin = false,
	append_fname = true,
	args = { "--output-format=json" },
	stream = nil,
	ignore_exitcode = false,
	env = nil,
	parser = function(output, _)
		local items = {}

		if output == "" then
			return items
		end

		local decoded = vim.json.decode(output) or {}

		for _, diag in ipairs(decoded.results) do
			table.insert(items, {
				source = "deadnix",
				lnum = diag.line - 1,
				col = diag.column - 1,
				end_lnum = diag.line - 1,
				end_col = diag.endColumn,
				message = diag.message,
				severity = vim.diagnostic.severity.WARN,
			})
		end
		return items
	end,
}

require("lint").linters_by_ft = {
	["*"] = { "codespell" },
	zsh = { "shellcheck" },
	sh = { "shellcheck" },
	python = { "ruff" },
	markdown = { "markdownlint" },
	yaml = { "yamllint" },
	dockerfile = { "hadolint" },
	terraform = { "tfsec", "trivy", "terraform_validate", "tflint" },
	tf = { "tfsec", "trivy", "terraform_validate", "tflint" },
	make = { "checkmake" },
	ansible = { "ansible-lint" },
	nix = { "deadnix", "nix" },
	tex = { "chktex" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		require("lint").try_lint()
	end,
})
