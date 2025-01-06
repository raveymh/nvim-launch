return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			sections = {
				{ section = "header" },
				{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
				{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
				{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{ section = "startup" },
			},
		},
		dim = { enabled = true },
		lazygit = { enabled = true },
		quickfile = { enabled = true },
		words = { enabled = true },
	},
	keys = {
		{
			"<leader>ii",
			function()
				Snacks.dim()
			end,
			desc = "Dim",
		},
		{
			"<leader>iu",
			function()
				Snacks.dim.disable()
			end,
			desc = "Undim",
		},
	},
}
