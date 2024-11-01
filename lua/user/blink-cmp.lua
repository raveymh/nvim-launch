local M = {
	"saghen/blink.cmp",
	lazy = false,
	event = "InsertEnter",
	dependencies = {
		{ "rafamadriz/friendly-snippets" },
	},
	version = "v0.*",
}

function M.config()
	local cmp = require("blink.cmp")
	cmp.setup({
		keymap = "super-tab",
		trigger = {
			signature_help = {
				enabled = false,
			},
		},
		windows = {
			autocomplete = { border = "rounded" },
			documentation = {
				border = "rounded",
				autoshow = true,
				auto_show_delay_ms = 210,
				update_delay_ms = 50,
			},
		},
		highlight = {
			use_nvim_cmp_as_default = true,
		},
		nerd_font_variant = "mono",
	})
	vim.api.nvim_set_hl(0, "BlinkCmpLabel", { link = "CmpItemMenu" })
	vim.api.nvim_set_hl(0, "BlinkCmpMenu", { link = "CmpItemMenu" })
end

return M
