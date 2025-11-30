local map = vim.keymap.set

-- ====================================================
--                 CORE & MOVEMENT
-- ====================================================

-- Αντιστροφή της βασικής κίνησης στον κώδικα
map({ "n", "v" }, "j", "k", { desc = "Move Up" })
map({ "n", "v" }, "k", "j", { desc = "Move Down" })

-- Command Mode Fix
-- Χρήση του ; αντί για : για να μην πατάς Shift
map({ "n", "v", "x" }, ";", ":", { desc = "Type commands with ;" })
map({ "n", "v", "x" }, ":", ";", { desc = "Use : for original ; behavior" })

-- ====================================================
--                 GENERAL UTILITIES
-- ====================================================

-- Select All (Επιλογή όλων)
map("n", "<leader>aa", "ggVG", { desc = "Select all text" })

-- Formatting (μέσω Conform)
map("n", "<leader>f", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end, { desc = "Format file" })

-- ====================================================
--                 WINDOW MANAGEMENT
-- ====================================================

-- Splits
map("n", "<leader>v", "<cmd>vsplit<cr>", { desc = "Vertical Split" })
map("n", "<leader>h", "<cmd>split<cr>", { desc = "Horizontal Split" })

-- Navigation (Ctrl + h/j/k/l)
-- Προσοχή: Ακολουθεί τη λογική J=Up, K=Down
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>k", { desc = "Go to upper window" }) -- J sends 'k' command (Up)
map("n", "<C-k>", "<C-w>j", { desc = "Go to lower window" }) -- K sends 'j' command (Down)
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize (Ctrl + Shift + h/j/k/l)
map("n", "<M-h>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Width" })
map("n", "<M-l>", "<cmd>vertical resize +2<cr>", { desc = "Increase Width" })
map("n", "<M-j>", "<cmd>resize +2<cr>", { desc = "Increase Height" })
map("n", "<M-k>", "<cmd>resize -2<cr>", { desc = "Decrease Height" })

-- ====================================================
--                 BUFFER MANAGEMENT
-- ====================================================

-- Buffer Navigation (Shift + h/l)
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })

-- Smart Close (Leader + q)
map("n", "<leader>q", function()
	local current_buf = vim.api.nvim_get_current_buf()
	local is_term = vim.bo[current_buf].buftype == "terminal"

	-- If it's a terminal buffer, just close the window
	if is_term then
		vim.cmd("close")
		return
	end

	-- Count listed buffers
	local buffers = vim.fn.getbufinfo({ buflisted = 1 })

	-- If there is more than one buffer, delete the current one
	if #buffers > 1 then
		vim.api.nvim_buf_delete(current_buf, { force = false })
	else
		-- If it's the last buffer, just quit Neovim
		vim.cmd("q")
	end
end, { desc = "Smart Close Buffer/Window" })

-- ====================================================
--                 SESSION MANAGEMENT
-- ====================================================

-- Θα σου ανοίξει μενού για να διαλέξεις ποιο project θες να φορτώσεις
map("n", "<leader>ss", function()
	require("persistence").select()
end, { desc = "Select Session List" })

-- Φόρτωσε το ΤΕΛΕΥΤΑΙΟ που άνοιξες γενικά (Last active)
map("n", "<leader>s", function()
	require("persistence").load({ last = true })
end, { desc = "Load Last Session" })

-- Σταματάει την καταγραφή και κλείνει το Neovim.
map("n", "<leader>sq", function()
	require("persistence").stop() -- Σταματάει το session recording
	vim.cmd("qa") -- Κλείνει τα πάντα (Quit All)
end, { desc = "Quit without saving session" })

-- ====================================================
--                     PLUGINS
-- ====================================================

-- === TELESCOPE ===
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files" })
map("n", "<leader>ft", "<cmd>Telescope live_grep<cr>", { desc = "Find text in files" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find open buffers" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Find recent files" })
map("n", "<leader>e", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { desc = "File Browser" })

-- === TERMINAL ===
-- A global function to toggle a horizontal terminal window
function _G.ToggleTerminal()
	local term_buf_found = nil
	-- Find the buffer number of the open terminal window
	for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
		local buf = vim.api.nvim_win_get_buf(win)
		if vim.bo[buf].buftype == "terminal" then
			term_buf_found = buf
			break
		end
	end

	if term_buf_found then
		-- If a terminal buffer is found, force-delete it.
		-- This closes the window and prevents the buffer from lingering.
		vim.cmd(term_buf_found .. "bdelete!")
	else
		-- If no terminal window is found, open a new one.
		vim.cmd("botright 15split | terminal")
	end
end

-- Map <C-z> in normal mode to call the toggle function
map("n", "<C-z>", "<cmd>lua _G.ToggleTerminal()<CR>", { desc = "Toggle Horizontal Terminal" })
-- Map <C-z> in terminal mode to exit terminal mode and then call the toggle function
map("t", "<C-z>", "<C-\\><C-n><cmd>lua _G.ToggleTerminal()<CR>", { desc = "Toggle Horizontal Terminal" })

map("n", "<leader>t", "<cmd>terminal<cr>i", { desc = "Open Terminal Buffer" })

-- === TROUBLE (Error List) ===
map("n", "<leader>x", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Toggle Error List" })

-- ====================================================
--               LSP & DIAGNOSTICS
-- ====================================================

-- Show Error/Warning (Leader + sh)
-- Ανοίγει το παράθυρο λάθους και βάζει τον κέρσορα μέσα
map("n", "<leader>dh", function()
	local _, winid = vim.diagnostic.open_float({ border = "rounded" })
	if winid then
		vim.api.nvim_set_current_win(winid)
	end
end, { desc = "Show Error/Warning" })

-- Show Documentation (Leader + sd)
-- Ανοίγει το documentation και βάζει τον κέρσορα μέσα (με μικρή καθυστέρηση)
map("n", "<leader>dd", function()
	vim.lsp.buf.hover({ border = "rounded" })

	vim.defer_fn(function()
		local wins = vim.api.nvim_tabpage_list_wins(0)
		for _, win in ipairs(wins) do
			local config = vim.api.nvim_win_get_config(win)

			if config.relative ~= "" and config.focusable then
				vim.api.nvim_set_current_win(win)
				-- Ρυθμίζουμε το 'q' να κλείνει ΜΟΝΟ αυτό το παράθυρο
				vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = vim.api.nvim_win_get_buf(win) })
				return
			end
		end
	end, 150) -- 150ms delay
end, { desc = "Show Documentation & Focus" })

-- LiveServer
-- === LIVE SERVER TOGGLE ===
local is_server_running = false

map("n", "<C-x>", function()
	if is_server_running then
		vim.cmd("LiveServerStop")
		is_server_running = false
		vim.notify("Live Server Stopped 🛑", vim.log.levels.INFO)
	else
		vim.cmd("LiveServerStart")
		is_server_running = true
		vim.notify("Live Server Started 🚀", vim.log.levels.INFO)
	end
end, { desc = "Toggle Live Server" })
