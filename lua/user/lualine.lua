local M = {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"folke/tokyonight.nvim",
	},
}

function M.config()
	local icons = require("user.icons")
	local current_signature = function(width)
		if not pcall(require, "lsp_signature") then
			return
		end
		local sig = require("lsp_signature").status_line(width)
		return sig.label .. sig.hint
	end
	local function signature()
		return current_signature(50)
	end
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
			lualine_x = {},
			lualine_y = { "progress", "filetype" },
			lualine_z = { { "os.date('%I:%M %p')" } },
		},
		inactive_winbar = {},

		extensions = { "quickfix", "man", "fugitive", "mason", "oil", "trouble", "toggleterm" },
	})
end

return M
