local servers = {
    -- Servers
    'bash-language-server',
    'shfmt',
    'shellcheck',
    'pylint',
    'clangd',
    'css-lsp',
    'html-lsp',
    'json-lsp',
    'jsonlint',
    'lua-language-server',
    'python-lsp-server',
    'marksman',
    'sqls',
    'typescript-language-server',
    'yaml-language-server',
    'ansible-language-server',
    'dockerfile-language-server',
    'docker-compose-language-service',
    'groovy-language-server',
    'helm-ls',
    -- 'java-language-server',
    'texlab',
    'rnix-lsp',
    'taplo',
    'terraform-ls',
    'tflint',
    'jedi-language-server',
    'autotools-language-server',
    'jsonnet-language-server',
    -- 'gopls',

    -- Linters
    'markdownlint',
    'markdown-toc',
    'isort',
    'glow',
    'checkstyle',
    'checkmake',
    'black',
    'ansible-lint',
    'hadolint',
    'actionlint'
}

require("mason").setup({
    ui = {
        border = "none",
        icons = {
            package_installed = "󰄳 ",
            package_pending = " ",
            package_uninstalled = "󰚌 "
        }
    }
})

require("mason-tool-installer").setup({
    ensure_installed = servers,
    auto_update = false,
    run_on_start = true
})
