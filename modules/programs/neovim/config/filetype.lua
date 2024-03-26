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
      html = "html"
    },
    shebang = {
      dash = "sh"
    }
  }
})
