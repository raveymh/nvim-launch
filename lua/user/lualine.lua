local M = {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = {
		"folke/tokyonight.nvim",
	},
}

function M.config()
	local icons = require("user.icons")
	require("lualine").setup({
		options = {
			theme = "nightfly",
			icons_enabled = true,
			ignore_focus = {},
			disabled_filetypes = {
				statusline = { "alpha", "lazygit" },
				winbar = {},
			},
			always_divide_middle = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = {},
			lualine_x = {
				{
					require("noice").api.status.command.get,
					cond = require("noice").api.status.command.has,
					color = { fg = "#dda6f7" },
				},
			},
			lualine_y = { "progress", "filetype" },
			lualine_z = { { "os.date('%I:%M %p')" } },
		},
		inactive_winbar = {},

		extensions = { "quickfix", "man", "fugitive", "mason", "oil", "trouble", "toggleterm" },
	})
end

return M
