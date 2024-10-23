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
			edit = "e",
			delete_mode = "d",
			clear_all_items = "C",
			toggle = "a", -- used as save if separate_save_and_remove is true
			open_vertical = "v",
			open_horizontal = "-",
			quit = "q",
			remove = "x", -- only used if separate_save_and_remove is true
			next_item = "]",
			prev_item = "[",
		},
		window = {
			border = "none",
		},
	},
}
