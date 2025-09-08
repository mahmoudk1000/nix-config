local capabilities = require("blink.cmp").get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.general.positionEncodings = { "utf-16" }

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("custom_lsp_attach", { clear = true }),
	callback = function(event)
		local bufnr = event.buf
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		local opts = { buffer = bufnr }

		if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
			vim.diagnostic.enable(false, { bufnr = bufnr })
			vim.defer_fn(function()
				vim.diagnostic.reset(nil, bufnr)
			end, 1000)
		end

		vim.api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })

		if not client then
			return
		end

		client.server_capabilities.semanticTokensProvider = nil

		local keymap = vim.keymap.set
		keymap("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
		keymap("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
		keymap("n", "gi", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "Go to implementation" }))
		keymap(
			"n",
			"gt",
			vim.lsp.buf.type_definition,
			vim.tbl_extend("force", opts, { desc = "Go to type definition" })
		)
		keymap("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "Go to references" }))
		keymap("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover documentation" }))
		keymap(
			"n",
			"<leader>dd",
			vim.diagnostic.open_float,
			vim.tbl_extend("force", opts, { desc = "Show diagnostic float" })
		)
		keymap("n", "<leader>la", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code Actions" }))
	end,
})

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = false,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = true,
		header = "",
		prefix = "",
		scope = "line",
	},
})

local lsps = {
	{ "bashls" },
	{ "jsonls" },
	{ "marksman" },
	{ "yamlls" },
	{ "ansiblels" },
	{ "dockerls" },
	{ "docker_compose_language_service" },
	{ "helm_ls" },
	{ "texlab" },
	{ "nil_ls" },
	{ "terraformls" },
	{ "tflint" },
	{ "autotools_ls" },
	{ "jsonnet_ls" },
	{ "jedi_language_server" },
	{ "gopls" },
	{ "groovyls", { filetypes = { "groovy" }, cmd = { "groovy-language-server" } } },
	{ "java_language_server", { cmd = { "java-language-server" } } },
	{
		"lua_ls",
		{
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
		},
	},
}

for _, lsp in ipairs(lsps) do
	local name, config = lsp[1], lsp[2]
	config = config or {}
	config.capabilities = capabilities
	vim.lsp.config(name, config)
	vim.lsp.enable(name)
end
