local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        -- Code Actions
        null_ls.builtins.code_actions.shellcheck,
        null_ls.builtins.code_actions.gitrebase,
        null_ls.builtins.code_actions.gitsigns,

        -- Completion
        -- null_ls.builtins.completion.luasnip,
        null_ls.builtins.completion.tags,
        null_ls.builtins.completion.spell,

        -- Diagnostic
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.diagnostics.pylint.with({
            diagnostics_postprocess = function(diagnostic)
                diagnostic.code = diagnostic.message_id
            end,
        }),
        null_ls.builtins.diagnostics.jsonlint,
        null_ls.builtins.diagnostics.terraform_validate,
        null_ls.builtins.diagnostics.tfsec,
        null_ls.builtins.diagnostics.trivy,
        null_ls.builtins.diagnostics.yamllint,
        null_ls.builtins.diagnostics.checkstyle.with({
            extra_args = { "-c", "/google_checks.xml" },
        }),
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.diagnostics.checkmake,
        null_ls.builtins.diagnostics.ansiblelint,
        null_ls.builtins.diagnostics.hadolint,
        null_ls.builtins.diagnostics.actionlint,
        null_ls.builtins.diagnostics.deadnix,

        -- Formatting
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.taplo,
        null_ls.builtins.formatting.yamlfmt,
        -- null_ls.builtins.formatting.markdown_toc,
        null_ls.builtins.formatting.nixfmt,
        null_ls.builtins.formatting.jsonnetfmt,
    }
})
