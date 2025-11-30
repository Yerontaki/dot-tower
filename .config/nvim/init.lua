-- 1. Ορίζουμε το Leader Key ΠΡΩΤΑ από όλα
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 2. Φορτώνουμε τις ρυθμίσεις (σειρά: options -> keymaps -> autocmds)
require("config.options")
require("config.keymaps")
require("config.autocmds")

-- 3. Φορτώνουμε τον Plugin Manager (Lazy)
require("config.lazy")
