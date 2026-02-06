require("lze").load({
	{
		"copilot.lua",
		event = "InsertEnter",
		after = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
				server_opts_overrides = {
					offset_encoding = "utf-16",
					settings = {
						telemetry = {
							telemetryLevel = "off",
						},
					},
				},
			})
		end,
	},
})
