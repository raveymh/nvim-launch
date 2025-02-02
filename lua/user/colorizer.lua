local M = {
	"NvChad/nvim-colorizer.lua",
	event = { "BufReadPost", "BufNewFile" },
}

function M.config()
	require("colorizer").setup({
		filetypes = { "*" },
		user_default_options = {
			names = false,
			rgb_fn = true,
			hsl_fn = true,
			tailwind = "both",
		},
		buftypes = {},
	})
end

return M
