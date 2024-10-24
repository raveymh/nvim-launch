return {
	"folke/zen-mode.nvim",
	opts = {
		plugins = {
			gitsigns = { enabled = false },
		},
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
}
