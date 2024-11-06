local M = {
	"ray-x/lsp_signature.nvim",
}

function M.config()
	local icons = require("user.icons")
	local cfg = {
		debug = true,
		log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log",
		bind = true,
		max_height = 6,
		max_width = 80,
		floating_window = false,
		close_timeout = 0,
		hint_enable = true,
		hint_prefix = " " .. icons.ui.Lightbulb,
		hint_scheme = "Comment",
		auto_close_after = 5,
		handler_opts = { border = "rounded" },
	}
	require("lsp_signature").setup(cfg)

	vim.keymap.set({ "n", "i" }, "<F3>", function()
		require("lsp_signature").toggle_float_win()
	end, { silent = true, noremap = true, desc = "Toggle signature window" })

	vim.keymap.set({ "n" }, "<Leader>ls", function()
		vim.lsp.buf.signature_help()
	end, { silent = true, noremap = true, desc = "Toggle signature help" })
end

return M
