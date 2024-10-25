return {
	"folke/lazydev.nvim",
	dependencies = { { "Bilal2453/luvit-meta", lazy = true } },
	event = "VeryLazy",
	ft = "lua",
	opts = {
		library = {
			{ path = "luvit-meta/library", words = { "vim%.uv" } },
		},
	},
}
