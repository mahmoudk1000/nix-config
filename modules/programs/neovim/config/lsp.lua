local lspconfig = require("lspconfig")

local servers = {
	"bashls",
	"jsonls",
	"marksman",
	"yamlls",
	"ansiblels",
	"dockerls",
	"docker_compose_language_service",
	"helm_ls",
	"texlab",
	"nil_ls",
	"terraformls",
	"tflint",
	"autotools_ls",
	"jsonnet_ls",
	"jedi_language_server",
	"gopls",
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

local on_attach = function(client, bufnr)
	if vim.g.extra_lsp_actions ~= nil then
		vim.g.extra_lsp_actions()
	end

	local function buf_set_option(name, value)
		vim.api.nvim_set_option_value(name, value, { buf = bufnr })
	end

	if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
		vim.diagnostic.enable(false, { bufnr = bufnr })
		vim.defer_fn(function()
			vim.diagnostic.reset(nil, bufnr)
		end, 1000)
	end

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	client.server_capabilities.semanticTokensProvider = nil

	local opts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
	vim.keymap.set(
		"n",
		"gi",
		vim.lsp.buf.implementation,
		vim.tbl_extend("force", opts, { desc = "Go to implementation" })
	)
	vim.keymap.set(
		"n",
		"gt",
		vim.lsp.buf.type_definition,
		vim.tbl_extend("force", opts, { desc = "Go to type definition" })
	)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "Go to references" }))

	vim.keymap.set(
		"n",
		"<leader>lh",
		vim.lsp.buf.hover,
		vim.tbl_extend("force", opts, { desc = "Hover documentation" })
	)
	vim.keymap.set(
		"n",
		"<leader>ls",
		vim.lsp.buf.signature_help,
		vim.tbl_extend("force", opts, { desc = "Signature help" })
	)
	vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
	vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code actions" }))
	vim.keymap.set("n", "<leader>lf", function()
		vim.lsp.buf.format({ async = true })
	end, vim.tbl_extend("force", opts, { desc = "Format document" }))
	vim.keymap.set("v", "<leader>lf", function()
		vim.lsp.buf.format({ async = true })
	end, vim.tbl_extend("force", opts, { desc = "Format selection" }))

	vim.keymap.set("n", "<leader>e", function()
		vim.diagnostic.open_float(nil, { focus = false, scope = "line" })
	end, vim.tbl_extend("force", opts, { desc = "Show diagnostics for current line" }))

	vim.keymap.set(
		"n",
		"<leader>dd",
		vim.diagnostic.open_float,
		vim.tbl_extend("force", opts, { desc = "Show diagnostic float" })
	)
	vim.keymap.set(
		"n",
		"<leader>dl",
		vim.diagnostic.setloclist,
		vim.tbl_extend("force", opts, { desc = "Diagnostic list" })
	)

	vim.keymap.set("n", "[d", function()
		vim.diagnostic.jump({ count = -1, float = true })
	end, vim.tbl_extend("force", opts, { desc = "Previous diagnostic" }))

	vim.keymap.set("n", "]d", function()
		vim.diagnostic.jump({ count = 1, float = true })
	end, vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))

	vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover documentation" }))

	vim.api.nvim_create_autocmd("BufEnter", {
		buffer = bufnr,
		callback = function()
			vim.cmd("syntax sync fromstart")
		end,
	})
end

-- Configure diagnostic display
vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = false,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
		scope = "line",
	},
})

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
	cmd = { "groovy-language-server" },
})

lspconfig.java_language_server.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "java-language-server" },
})

lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
			workspace = {
				checkThirdParty = false,
				library = { vim.env.VIMRUNTIME },
			},
			telemetry = { enable = false },
		},
	},
})

vim.cmd("doautocmd FileType")
