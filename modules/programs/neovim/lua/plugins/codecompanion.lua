require("lze").load({
	{
		"codecompanion",
		cmd = "CodeCompanion",
		keys = {
			{ "<C-x>", ":CodeCompanionActions<CR>", desc = "AI Code Actions" },
			{ "<C-a>", ":CodeCompanionChat<CR>", desc = "AI Code Chat" },
			{ "<C-ga>", ":CodeCompanionChat Add<CR>", desc = "AI Code Actions" },
		},
		after = function()
			require("codecompanion").setup({
				strategies = {
					chat = {
						adapter = "copilot",
						roles = {
							-- https://github.com/olimorris/codecompanion.nvim/discussions/1094
							llm = function(adapter)
								local model = ""
								if adapter.schema and adapter.schema.model and adapter.schema.model.default then
									model = adapter.schema.model.default
									if type(model) == "function" then
										model = model(adapter)
									end
								end

								return "  " .. adapter.formatted_name .. " (" .. model .. ")"
							end,
							user = "Mahmoud",
						},
					},
					inline = {
						adapter = "copilot",
					},
				},
				display = {
					chat = {
						window = {
							position = "right",
							width = 0.33,
						},
					},
				},
				adapters = {
					http = {
						copilot = function()
							return require("codecompanion.adapters").extend("copilot", {
								schema = {
									model = {
										default = "gpt-4.1",
									},
								},
							})
						end,
					},
				},
			})
		end,
	},
})
