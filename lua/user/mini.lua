local M = {
	"echasnovski/mini.nvim",
}

function M.config()
	require("mini.ai").setup({ n_lines = 42 })
	require("mini.bracketed").setup()
	require("mini.move").setup()
	require("mini.surround").setup()
	-- require("mini.notify").setup({ lsp_progress = { enable = true } })
	-- require("mini.operators").setup()
	require("mini.icons").setup()
	require("mini.indentscope").setup({
		draw = {
			animation = require("mini.indentscope").gen_animation.linear({ duration = 35, unit = "total" }),
		},
		options = { try_as_border = true },

		-- Disable for certain filetypes
		vim.api.nvim_create_autocmd({ "FileType" }, {
			desc = "Disable indentscope for certain filetypes",
			callback = function()
				local ignore_filetypes = {
					"dashboard",
					"alpha",
					"oil",
				}
				if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
					vim.b.miniindentscope_disable = true
				end
			end,
		}),
	})
	require("mini.sessions").setup()
	-- require("mini.completion").setup({
	-- 	delay = {
	-- 		completion = 10000000,
	-- 		signature = 100,
	-- 	},
	-- 	window = {
	-- 		info = {
	-- 			border = "single",
	-- 		},
	-- 		signature = {
	-- 			border = "rounded",
	-- 		},
	-- 	},
	--
	-- 	lsp_completion = {
	-- 		auto_setup = false,
	-- 	},
	-- })
	-- require("mini.pairs").setup()
	-- require("mini.tabline").setup()
	require("mini.extra").setup()
end

return M
