return {
	{
		"folke/trouble.nvim",
		opts = {
			focus = true,

			win = {
				position = "bottom",
				size = 15,
			},

			modes = {
				diagnostics = {
					filter = {
						any = {
							{ severity = vim.diagnostic.severity.ERROR },
							{ severity = vim.diagnostic.severity.WARN },
							{ severity = vim.diagnostic.severity.INFO },
							{ severity = vim.diagnostic.severity.HINT },
						},
					},
				},
			},
		},
		cmd = "Trouble",
	},
}
