require("filetype").setup({
  overrides = {
    extensions = {
      sh = "sh",
      tfvars = "terraform",
      tfstate = "json",
      latex = "tex"
    },
    shebang = {
      dash = "sh"
    }
  }
})
