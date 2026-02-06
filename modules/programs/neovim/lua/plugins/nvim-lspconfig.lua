require("lze").load({
	{
		"nvim-lspconfig",
		priority = 90,
		on_require = { "lspconfig" },
		lsp = function(plugin)
			local capabilities = require("blink.cmp").get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())
			capabilities.general.positionEncodings = { "utf-16" }

			local config = plugin.lsp or {}
			config.capabilities = capabilities

			vim.lsp.config(plugin.name, config)
			vim.lsp.enable(plugin.name)
		end,
		before = function(_)
			vim.lsp.config("*", {
				on_attach = function(_, bufnr)
					local opts = { buffer = bufnr }

					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "<leader>ds", vim.lsp.buf.document_symbol, opts)
					vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
				end,
			})
			vim.diagnostic.config({
				virtual_text = true,
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
		end,
	},

	{
		"bashls",
		lsp = {
			filetypes = { "sh", "bash" },
		},
	},

	{
		"jsonls",
		lsp = {
			filetypes = { "json", "jsonc" },
		},
	},

	{
		"sqls",
		lsp = {
			filetypes = { "sql", "mysql" },
		},
	},

	{
		"marksman",
		lsp = {
			filetypes = { "markdown", "markdown.mdx" },
		},
	},

	{
		"yamlls",
		lsp = {
			filetypes = { "yaml", "yml" },
			before_init = function(_, config)
				local k8s = require("extra.k8s-schemas")
				config.settings.yaml.schemas = config.settings.yaml.schemas or {}
				if k8s.isKubernetesResource() then
					config.settings.yaml.customTags = {}
					config.settings.yaml.schemas =
						vim.tbl_extend("force", k8s.buildScheme(), config.settings.yaml.schemas)
				end
			end,
			settings = {
				redhat = {
					telemetry = { enabled = false },
				},
				yaml = {
					validate = true,
					hover = true,
					completion = true,
					schemaStore = {
						enable = false,
						url = "",
					},
					schemas = {
						["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*.{yaml,yml}",
						["https://json.schemastore.org/github-action.json"] = ".github/action.{yaml,yml}",
						["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yaml,yml}",
						["https://json.schemastore.org/ansible-playbook.json"] = "*play*.{yaml,yml}",
						["https://json.schemastore.org/chart.json"] = "Chart.{yaml,yml}",
						["https://json.schemastore.org/kustomization.json"] = "kustomization.{yaml,yml}",
						["https://json.schemastore.org/dependabot-v2.json"] = ".github/dependabot.{yaml,yml}",
						["https://json.schemastore.org/gitlab-ci.json"] = "*gitlab-ci*.{yaml,yml}",
						["https://json.schemastore.org/prettierrc.json"] = ".prettierrc.{yaml,yml}",
						["https://json.schemastore.org/ansible-stable-2.9.json"] = "roles/tasks/*.{yaml,yml}",
					},
					customTags = {
						"!Ref",
						"!Condition",
						"!GetAtt",
						"!Join",
						"!Select",
						"!Split",
						"!Sub",
						"!Base64",
						"!GetAZs",
						"!ImportValue",
						"!FindInMap",
						"!Equals",
						"!If",
						"!And",
						"!Or",
						"!Not",
					},
					suggest = {
						parentSkeletonSelectedFirst = true,
					},
					format = {
						enable = true,
						singleQuote = false,
						bracketSpacing = true,
						proseWrap = "preserve",
						printWidth = 120,
					},
				},
			},
		},
	},

	{
		"dockerls",
		lsp = {
			filetypes = { "dockerfile" },
		},
	},

	{
		"docker_compose_language_service",
		lsp = {
			filetypes = { "yaml.docker-compose" },
		},
	},

	{
		"helm_ls",
		lsp = {
			filetypes = { "helm" },
		},
	},

	{
		"texlab",
		lsp = {
			filetypes = { "tex", "plaintex", "bib" },
		},
	},

	{
		"nil_ls",
		lsp = {
			filetypes = { "nix" },
			root_markers = { "flake.nix", ".git" },
			settings = {
				formatting = {
					command = { "nixfmt" },
				},
			},
		},
	},

	{
		"terraformls",
		lsp = {
			filetypes = { "terraform", "terraform-vars" },
		},
	},

	{
		"tflint",
		lsp = {
			filetypes = { "terraform" },
		},
	},

	{
		"jsonnet_ls",
		lsp = {
			filetypes = { "jsonnet", "libsonnet" },
		},
	},

	{
		"ruff",
		lsp = {
			filetypes = { "python" },
		},
	},

	{
		"gopls",
		lsp = {
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
			settings = {
				analyses = {
					unusedparams = true,
				},
				staticcheck = true,
				usePlaceholders = true,
				completeUnimported = true,
				gofumpt = true,
			},
		},
	},

	{
		"groovyls",
		lsp = {
			filetypes = { "groovy" },
			cmd = { "groovy-language-server" },
		},
	},

	{
		"lua_ls",
		lsp = {
			filetypes = { "lua" },
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
})
