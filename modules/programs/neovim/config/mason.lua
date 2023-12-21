local servers = {
    'bashls',
    'clangd',
    'cssls',
    'html',
    'jsonls',
    'lua_ls',
    'pylsp',
    'marksman',
    'sqlls',
    'tsserver',
    'yamlls',
    'ansiblels',
    'dockerls',
    'docker_compose_language_service',
    'groovyls',
    'helm_ls',
    'jsonls',
    -- 'java_language_server',
    'texlab',
    'rnix',
    'taplo',
    'terraformls',
    'tflint',
    'jedi_language_server',
    'autotools-language-server'
}

require("mason").setup ({
    ui = {
        border = "none",
        icons = {
            package_installed = "󰄳 ",
            package_pending = " ",
            package_uninstalled = "󰚌 "
        }
    }
})

require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true
})
