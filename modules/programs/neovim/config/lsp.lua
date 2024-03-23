local lspconfig = require("lspconfig")

-- nvim-cmp supports additional completion capabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Enable the following language servers
local servers = {
  'clangd',
  'cssls',
  'bashls',
  'html',
  'jsonls',
  'marksman',
  'sqls',
  'tsserver',
  'yamlls',
  'ansiblels',
  'dockerls',
  'docker_compose_language_service',
  'helm_ls',
  'jsonls',
  'texlab',
  'nixd',
  'taplo',
  'terraformls',
  'tflint',
  'autotools_ls',
  'jsonnet_ls',
  'gopls',
  'ruff_lsp',
  'ruff'
}

-- LSP settings.
local on_attach = function(_, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Options.
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)

  local opts = { noremap = true, silent = true }
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

lspconfig.groovyls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "groovy" },
  cmd = { "groovy-language-server" }
})

lspconfig.java_language_server.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "java-language-server" }
}

lspconfig.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = { library = vim.api.nvim_get_runtime_file('', true) },
      telemetry = { enable = false, }
    }
  }
})
