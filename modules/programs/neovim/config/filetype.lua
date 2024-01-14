require("filetype").setup({
  overrides = {
    extensions = {
      sh = "sh",
      tfvars = "terraform",
	  tfstate = "json",
    },
    shebang = {
      dash = "sh"
    }
  }
})
