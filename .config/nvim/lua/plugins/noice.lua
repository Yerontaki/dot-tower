return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()


			require("noice").setup({
				cmdline = {
					enabled = true,
					format = {
						cmdline = { pattern = "^:", icon = "", lang = "vim", view = "cmdline_popup" },
						search_down = {
							kind = "search",
							pattern = "^/",
							icon = " ",
							lang = "regex",
							view = "cmdline_popup_search",
						},
						search_up = {
							kind = "search",
							pattern = "^%?",
							icon = " ",
							lang = "regex",
							view = "cmdline_popup_search",
						},
					},
				},

				views = {
					cmdline_popup = {
						position = {
							row = "10%",
							col = "50%",
						},
						size = {
							width = 35,
							height = "auto",
						},
						border = {
							style = "rounded",
							padding = { 0, 1 },
						},
						win_options = {
							winhighlight = {
								Normal = "Normal",
								FloatBorder = "NoiceCmdlinePopupBorder",
							},
						},
					},
					cmdline_popup_search = {
						backend = "popup",
						position = {
							row = "10%",
							col = "50%",
						},
						size = {
							width = 35,
							height = "auto",
						},
						border = {
							style = "rounded",
							padding = { 0, 1 },
						},
						win_options = {
							winhighlight = {
								Normal = "Normal",
								FloatBorder = "NoiceSearchPopupBorder",
							},
						},
					},
					popupmenu = {
						relative = "editor",
						position = {
							row = 8,
							col = "50%",
						},
						size = {
							width = 60,
							height = 10,
						},
						border = {
							style = "rounded",
							padding = { 0, 1 },
						},
						win_options = {
							winhighlight = { Normal = "Normal", FloatBorder = "NoiceCmdlinePopupBorder" },
						},
					},
				},

				routes = {
					{
						filter = {
							event = "msg_show",
							kind = "",
							find = "yanked",
						},
						opts = { skip = true },
					},
					{
						filter = {
							event = "msg_show",
							kind = "",
							find = "written",
						},
						opts = { skip = true },
					},
				},

				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},

				presets = {
					bottom_search = false,
					command_palette = true,
					long_message_to_split = true,
				},
			})
		end,
	},
}
