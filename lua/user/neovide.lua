if vim.g.neovide then
	-- Neovide settings
	vim.keymap.set({ "n", "v", "x" }, "<C-v>", "p")
	vim.keymap.set("i", "<C-v>", '<ESC>l"+Pli')
	vim.g.neovide_cursor_animation_length = 0.1
	vim.g.neovide_cursor_trail_size = 0.4
	vim.g.neovide_scroll_animation_length = 0.25
	vim.g.neovide_hide_mouse_when_typing = true
	vim.g.neovide_profiler = false
end
