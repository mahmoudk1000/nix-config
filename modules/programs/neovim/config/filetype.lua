require("filetype").setup({
	overrides = {
		extensions = {
			sh = "sh",
			env = "sh",
			mdx = "markdown",
			tfvars = "terraform",
			tfstate = "json",
			latex = "tex",
			bib = "tex",
			html = "html",
		},
		literal = {
			Jenkinsfile = "groovy",
		},
		shebang = {
			dash = "sh",
		},
		complex = {
			[".*/Dockerfile[^/]*"] = "dockerfile",
		},
	},
})
