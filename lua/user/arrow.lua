return {
	"otavioschwanck/arrow.nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
	},
	opts = {
		show_icons = true,
		hide_handbook = true,
		leader_key = ";", -- Recommended to be a single key
		buffer_leader_key = "<A-;>",
		mappings = {
			toggle = "a",
		},
		window = {
			border = "none",
		},
	},
}
