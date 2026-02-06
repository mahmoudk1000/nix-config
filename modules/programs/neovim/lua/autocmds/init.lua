local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local highlight_group = augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
	pattern = "*",
	group = highlight_group,
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
	desc = "Highlight yanked text",
})

vim.filetype.add({
	extension = {
		sh = "sh",
		env = "sh",
		mdx = "markdown",
		tfvars = "terraform",
		tfstate = "json",
		latex = "tex",
		bib = "tex",
		jsonnet = "jsonnet",
		libsonnet = "jsonnet",
	},
	filename = {
		["Jenkinsfile"] = "groovy",
		["kubeconfig"] = "yaml",
		[".env"] = "sh",
		[".envrc"] = "sh",
		["Dockerfile"] = "dockerfile",
		["docker-compose.yml"] = "yaml.docker-compose",
		["docker-compose.yaml"] = "yaml.docker-compose",
	},
	pattern = {
		["Dockerfile[^/]*"] = "dockerfile",
		["docker%-compose%.y.?ml"] = "yaml.docker-compose",
		[".*/templates/.*%.yaml"] = "helm",
		[".*/templates/.*%.yml"] = "helm",
		[".*%.tf"] = "terraform",
		[".*%.tfvars"] = "terraform",
	},
})
