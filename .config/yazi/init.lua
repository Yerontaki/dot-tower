-- function Manager:render()
-- 	if ya.target_family() ~= "unix" then
-- 		return
-- 	end
--
-- 	local cwd = os.getenv("NIRI_CURSOR_X") and cx.active.current.cwd or nil
-- 	if cwd then
-- 		ya.manager_emit("cd", { cwd:url() })
-- 	end
-- end

require("full-border"):setup({
	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
	type = ui.Border.ROUNDED,
})

require("git"):setup()

require("recycle-bin"):setup({
	-- Optional: Override automatic trash directory discovery
	-- trash_dir = "~/.local/share/Trash/",  -- Uncomment to use specific directory
})

require("smart-enter"):setup({
	open_multi = true,
})
