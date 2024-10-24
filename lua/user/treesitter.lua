local M = {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
}

function M.config()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"diff",
			"gdscript",
			"godot_resource",
			"gdshader",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"bash",
			"python",
			"javascript",
			"typescript",
		},
		sync_install = false,
		auto_install = true,
		highlight = { enable = true, additional_vim_regex_highlighting = { "ruby" } },
		indent = { enable = true },
	})
end

return M
