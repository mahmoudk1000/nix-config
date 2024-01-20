local lspconfig = require("lspconfig")

-- nvim-cmp supports additional completion capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true
}

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
  'rnix',
  'taplo',
  'terraformls',
  'tflint',
  'jedi_language_server',
  'autotools_ls',
  'jsonnet_ls',
  'gopls'
}

-- LSP settings.
local on_attach = function(_, bufnr)
  -- Options.
  vim.api.nvim_buf_set_option(bufnr, "formatexpr", "")

  -- Mappings.
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)

  local opts = { noremap=true, silent=true }
  vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

-- Make runtime files discoverable to the server.
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

lspconfig.groovyls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "groovy" },
  cmd = { "groovy-language-server" }
})

lspconfig.java_language_server.setup {
  cmd = { "java-language-server" }
}

lspconfig.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = runtime_path,
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = { library = vim.api.nvim_get_runtime_file('', true) },
      telemetry = { enable = false, },
    },
  }
})

lspconfig.pylsp.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    pylsp = {
      plugins = {
        black = {
          enabled = true
        },
        pylint = {
          enabled = true,
          executable = "pylint"
        },
        isort = {
          enabled = true
        },
        jedi_completion = {
          enabled = true
        },
        pycodestyle = {
          enabled = true,
          ignore = {'W391'},
          maxLineLength = 100
        }
      }
    }
  }
})
