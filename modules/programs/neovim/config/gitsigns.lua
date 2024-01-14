require("gitsigns").setup({
  signs = {
    add = { hl = "GitGutterAdd", text = '🞧', numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change = { hl = "GitGutterChange", text = '⏺', numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete = { hl = "GitGutterDelete", text = '🭸', numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete = { hl = "GitGutterDeleteChange", text = '🭶', numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = { hl = "GitGutterChange", text = '~', numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    untracked = { hl = "GitGutterAdd", text = '🞧', numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" }
  }
})
