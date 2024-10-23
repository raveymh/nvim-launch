return {
	"ray-x/lsp_signature.nvim",
	event = "VeryLazy",
	opts = {
		bind = true,
		floating_window = false,
		floating_window_above_cur_line = false,
		hint_prefix = "•",
		hint_scheme = "Identifier",
		handler_opts = {
			border = "rounded",
		},
	},
	config = function(_, opts)
		require("lsp_signature").setup(opts)
	end,

	vim.keymap.set({ "n", "i" }, "<C-n>", function()
		require("lsp_signature").toggle_float_win()
	end, { silent = true, noremap = true, desc = "Toggle signature" }),
}
