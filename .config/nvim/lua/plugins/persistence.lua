return {
	"folke/persistence.nvim",
	lazy = false, -- Το θέλουμε να φορτώνει ΑΜΕΣΩΣ για να προλάβει να κάνει restore
	opts = {},
	config = function()
		require("persistence").setup()

		-- Αυτόματος μηχανισμός επαναφοράς
		vim.api.nvim_create_autocmd("VimEnter", {
			group = vim.api.nvim_create_augroup("restore_session", { clear = true }),
			nested = true,
			callback = function()
				-- Αν γράψεις σκέτο 'nvim' (χωρίς ορίσματα)
				if vim.fn.argc() == 0 then
					-- Προσπάθησε να φορτώσεις το τελευταίο session
					require("persistence").load({ last = true })
				end
			end,
		})
	end,
}
