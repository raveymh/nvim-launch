local M = {
	"kawre/neotab.nvim",
	event = "InsertEnter",
}

function M.config()
	require("neotab").setup({
		tabkey = "<Tab>",
		smart_punctuators = {
			enabled = false,
			semicolon = {
				enabled = false,
				ft = { "cs", "c", "cpp", "java" },
			},
		},
	})
end

return M
