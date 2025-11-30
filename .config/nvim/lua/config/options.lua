local opt = vim.opt
local g = vim.g

-- ===================================================================
-- DATA DIRECTORIES (Swap, Backup, Undo)
-- ===================================================================
-- Set a central directory for Neovim data
local data_dir = vim.fn.stdpath("data") .. "/nvim-data"

-- Create the directory if it doesn't exist
if not vim.fn.isdirectory(data_dir) then
	vim.fn.mkdir(data_dir, "p")
end

-- Disable creating backup and swap files in the project directory
opt.backup = false
opt.swapfile = false

-- Set the central directories
opt.backupdir = data_dir .. "/backup"
opt.directory = data_dir .. "/swap"
opt.undodir = data_dir .. "/undo"
opt.undofile = true -- This was already set, which is good

-- ===================================================================
-- GENERAL OPTIONS
-- ===================================================================
opt.clipboard = "unnamedplus"
opt.cmdheight = 0
opt.tabstop = 2
opt.shiftwidth = 2
opt.showtabline = 2
opt.signcolumn = "yes"
opt.wrap = false
opt.cursorcolumn = false
opt.ignorecase = true
opt.smartindent = true
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
