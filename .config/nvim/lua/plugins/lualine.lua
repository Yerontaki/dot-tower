return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin",
				globalstatus = true,
				component_separators = "",
				section_separators = "",
				disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
			},
			sections = {
				lualine_a = {
					{
						"mode",
						separator = { left = "", right = "" },
						right_padding = 2,
					},
				},
				lualine_b = {
					{
						"filename",
						separator = { left = "", right = "" },
					},
				},

				lualine_c = {
					{
						"branch",
						icon = "",
						separator = { right = "" },
						padding = { left = 1, right = 1 },
						margin = { right = 1, left = 1 },
					},
				},

				lualine_x = {
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						sections = { "error", "warn", "info" },
						symbols = { error = " ", warn = " ", info = " " },
						margin = { left = 1, right = 1 },
						always_visible = true,
					},
				},

				lualine_y = {
					{
						"filetype",
						separator = { left = "", right = "" },
						margin = { left = 1, right = 1 },
					},
				},

				lualine_z = {
					{
						function()
							return " " .. os.date("%A %d/%m")
						end,
						separator = { left = "", right = "" },
						padding = { left = 1, right = 1 },
					},
				},
			},
			extensions = { "toggleterm", "mason", "lazy" },
		})
	end,
}
