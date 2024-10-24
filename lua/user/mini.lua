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
	require("mini.hipatterns").setup({
		highlighters = {
			fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
			hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
			todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
			note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

			-- Highlight hex color strings (`#rrggbb`) using that color
			hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
		},
	})
	require("mini.indentscope").setup({
		draw = {
			animation = require("mini.indentscope").gen_animation.linear({ duration = 50, unit = "total" }),
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
