return {
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				"*",
			}, {
				RGB = true,
				RRGGBB = true,
				names = true,
				RRGGBBAA = true,
				css = true,
				css_fn = true,
				mode = "background",
			})
		end,
	},
}
