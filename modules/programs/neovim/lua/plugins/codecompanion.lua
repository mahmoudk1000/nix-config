require("lze").load({
	{
		"codecompanion",
		event = "BufReadPre",
		keys = {
			{ "<C-x>", ":CodeCompanionActions<CR>", desc = "AI Code Actions" },
		},
		after = function()
			require("codecompanion").setup({
				strategies = {
					chat = {
						user = "Mahmoud",
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
							width = 0.35,
						},
					},
				},
				adapters = {
					http = {
						opts = {
							show_model_choices = true,
						},
						copilot = function()
							return require("codecompanion.adapters").extend("copilot", {
								schema = {
									model = {
										default = "claude-haiku-4.5",
										choices = {
											["gpt-4.1"] = {
												opts = {
													can_use_tools = true,
												},
											},
											["gpt-5.2"] = {
												opts = {
													can_use_tools = true,
													has_vision = true,
												},
											},
											["gpt-5.3-codex"] = {
												opts = {
													can_use_tools = true,
													has_vision = true,
												},
											},
											["claude-haiku-4.5"] = {
												opts = {
													can_reason = true,
													can_use_tools = true,
													has_vision = true,
												},
											},
											["gemini-3-pro-preview"] = {
												opts = {
													can_reason = true,
													can_use_tools = true,
												},
											},
										},
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
