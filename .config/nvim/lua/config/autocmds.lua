-- Set autocommands
local autocmd = vim.api.nvim_create_autocmd
local api = vim.api

-- Auto change directory to project root or file's directory
local function set_working_directory()
	local file_path = api.nvim_buf_get_name(0)
	if file_path == "" or vim.fn.filereadable(file_path) == 0 then
		return
	end

	-- Try to find git root first
	local git_dir = vim.fn.finddir(".git", vim.fn.fnamemodify(file_path, ":p:h") .. ";")
	if git_dir ~= "" then
		local git_root = vim.fn.fnamemodify(git_dir, ":h")
		vim.cmd("silent! tcd " .. git_root)
		return
	end

	-- If no git root, just cd to the file's directory
	local file_dir = vim.fn.fnamemodify(file_path, ":p:h")
	vim.cmd("silent! tcd " .. file_dir)
end

autocmd("BufEnter", {
	pattern = "*",
	callback = set_working_directory,
	desc = "Auto change CWD to git root or file's directory",
})

-- Highlight on Yank: Φωτίζει το κείμενο όταν κάνεις copy
api.nvim_create_autocmd("TextYankPost", {
	group = api.nvim_create_augroup("highlight_yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Auto Save on Insert Leave
api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
	pattern = { "*" },
	command = "silent! update",
	nested = true,
})

-- Σβήνει αυτόματα τα περιττά κενά στο τέλος της γραμμής όταν σώζεις
api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	command = [[%s/\s\+$//e]],
})