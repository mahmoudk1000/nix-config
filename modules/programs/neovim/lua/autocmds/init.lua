local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	group = highlight_group,
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.filetype.add({
	extensions = {
		sh = "sh",
		env = "sh",
		mdx = "markdown",
		tfvars = "terraform",
		tfstate = "json",
		latex = "tex",
		bib = "tex",
	},
	filename = {
		["Jenkinsfile"] = "groovy",
		["kubeconfig"] = "yaml",
	},
	pattern = {
		["Dockerfile[^/]*"] = "dockerfile",
		["docker%-compose%.y.?ml"] = "yaml.docker-compose",
		[".*/templates/.*%.yaml"] = "helm",
	},
})
