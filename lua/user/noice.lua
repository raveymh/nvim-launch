local M = {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		-- "rcarriga/nvim-notify",
	},
}

function M.config()
	require("noice").setup({
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
			},
			signature = {
				enabled = true,
				auto_open = {
					trigger = true,
				},
				view = "signature_hover",
			},
		},
		presets = {
			bottom_search = true, -- use a classic bottom cmdline for search
			command_palette = false, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = false, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
		cmdline = {
			view = "cmdline",
		},
		views = {
			confirm = {
				align = "center",
				position = {
					row = "50%",
					col = "50%",
				},
			},
			signature_hover = {
				view = "popup",
				relative = "cursor",
				zindex = 45,
				enter = false,
				anchor = "auto",
				size = {
					width = "auto",
					height = "auto",
					max_height = 12,
					max_width = 90,
				},
				border = {

					style = "single",
					padding = { 0, 1 },
				},
				position = { row = 3, col = 3 },
				win_options = {
					wrap = true,
					linebreak = true,
				},
			},
		},
	})
end

return M
