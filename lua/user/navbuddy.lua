return {
	"SmiteshP/nvim-navbuddy",
	dependencies = "MunifTanjim/nui.nvim",

	opts = { lsp = { auto_attach = true } },

	require("which-key").add({ "<leader>ln", "<cmd>Navbuddy<CR>", desc = "Navigate buddy" }),
}
