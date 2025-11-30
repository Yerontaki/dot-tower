return {
	{ "nvim-tree/nvim-web-devicons", lazy = true },

	{
		"akinsho/bufferline.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		version = "*",
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers",
					path_components = 1,
					show_buffer_close_icons = false,
					show_close_icon = false,
					separator_style = "thin",
					always_show_bufferline = true,
				},
			})
		end,
	},
}
