local M = {
	"aaronik/treewalker.nvim",
}

function M.config()
	require("treewalker").setup({
		highlight = true,
		highlight_dura = 250,
		highlight_group = "CursorLine",
	})
	vim.keymap.set({ "n", "v" }, "<C-k>", "<cmd>Treewalker Up<cr>", { silent = true })
	vim.keymap.set({ "n", "v" }, "<C-j>", "<cmd>Treewalker Down<cr>", { silent = true })
	vim.keymap.set({ "n", "v" }, "<C-l>", "<cmd>Treewalker Right<cr>", { silent = true })
	vim.keymap.set({ "n", "v" }, "<C-h>", "<cmd>Treewalker Left<cr>", { silent = true })
end

return M
