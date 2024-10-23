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
		keymap = {
			show = "<C-space>",
			hide = { "<C-e>", "<Left>" },
			accept = "<Tab>",
			select_prev = { "<Up>", "<C-k>" },
			select_next = { "<Down>", "<C-j>" },
			show_documentation = "<C-l>",
			hide_documentation = "<C-h>",
			scroll_documentation_up = "<C-u>",
			scroll_documentation_down = "<C-d>",

			snippet_forward = "<Tab>",
			snippet_backward = "<S-Tab>",
		},
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
				auto_show_delay_ms = 250,
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
