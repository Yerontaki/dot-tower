return {
	{
		"barrett-ruth/live-server.nvim",
		build = "npm install -g live-server", -- Αυτόματη εγκατάσταση του εργαλείου
		cmd = { "LiveServerStart", "LiveServerStop" }, -- Φορτώνει μόνο όταν το ζητήσεις
		config = function()
			require("live-server").setup({
				args = {
					"--port=5500", -- Κλασική πόρτα
					"--browser=firefox", -- Ανοίγει τον default browser σου
					"--quiet", -- Λιγότερη φασαρία στα logs
				},
			})
		end,
	},
}
