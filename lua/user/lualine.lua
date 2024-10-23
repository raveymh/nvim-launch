local M = {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"folke/tokyonight.nvim",
	},
}
local navic = require("user.navic")
local date_time = os.date("%a")

function M.config()
	require("lualine").setup({
		options = {
			theme = "nightfly",
			icons_enabled = true,
			ignore_focus = {},
			disabled_filetypes = {
				statusline = {"alpha", "lazygit"},
				winbar = {},
			},
			always_divide_middle = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { "" },
			lualine_x = { "" },
			lualine_y = { "encoding", "filetype" },
			lualine_z = { { "os.date('%I:%M %p')" } },
		},
		inactive_winbar = {},

		extensions = { "quickfix", "man", "fugitive", "mason", "oil", "trouble", "toggleterm" },
	})
end

return M