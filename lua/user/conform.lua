local M = {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
}

function M.config()
	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua", lsp_format = "fallback" },
			-- Conform will run multiple formatters sequentially
			python = { "isort", "black" },
			-- You can customize some of the format options for the filetype (:help conform.format)
			rust = { "rustfmt", lsp_format = "fallback" },
			-- Conform will run the first available formatter
			javascript = { "prettierd", "prettier", stop_after_first = true },
			gdscript = { "gdformat" },
		},

		-- format_on_save = {
		-- 	-- These options will be passed to conform.format()
		-- 	timeout_ms = 600,
		-- 	lsp_format = "fallback",
		-- },

		format_after_save = {
			lsp_format = "fallback",
		},

		-- formatters = {
		-- 	shfmt = {
		-- 		prepend_args = { "-i", "2" },
		-- 	},
		-- },
	})

	-- vim.api.nvim_create_autocmd("BufWritePre", {
	-- 	pattern = "*",
	-- 	callback = function(args)
	-- 		require("conform").format({ bufnr = args.buf })
	-- 	end,
	-- })
end

return M
