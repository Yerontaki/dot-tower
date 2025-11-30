return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"go",
					"gomod",
					"gosum",
					"lua",
					"vim",
					"vimdoc",
					"html",
					"css",
					"javascript",
					"typescript",
					"json",
					"markdown",
					"markdown_inline",
					"bash",
					"regex",
				},

				auto_install = true,

				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},

				indent = {
					enable = true,
				},
			})
		end,
	},
}
