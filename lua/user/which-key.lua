local M = {
	"folke/which-key.nvim",
}

function M.config()
	local icons = require("user.icons")
	local which_key = require("which-key")
	local spec = {
		{
			"<leader>b",
			group = "Buffers",
			-- expand = function()
			-- 	return require("which-key.extras").expand.buf()
			-- end,
		},
		{ "<leader>f", group = "Find", icon = icons.ui.Telescope },
		{ "<leader>g", group = "Git" },
		{ "<leader>gt", group = "Toggle" },
		{ "<leader>l", group = "LSP", icon = icons.ui.Code },
		{ "<leader>d", group = "Debug" },
		{ "<leader>k", group = "Test" },
		{
			"<leader>o",
			group = "Godot",
			icon = require("nvim-web-devicons").get_icon("godot", ".gd", { default = true }),
		},
		{
			{ "<leader>ol", desc = "Lint", icon = icons.ui.Pencil },
			{ "<leader>oo", desc = "Code Order", icon = icons.ui.Note },
		},
		{ "<leader>t", group = "Tabs" },
		{
			{ "<leader>tn", "<cmd>$tabnew<cr>", desc = "New Empty Tab" },
			{ "<leader>tt", "<cmd>tabnew %<cr>", desc = "New Tab" },
			{ "<leader>to", "<cmd>tabonly<cr>", desc = "Only" },
			{ "<leader>th", "<cmd>tabnext<cr>", desc = "Next Tab" },
			{ "<leader>tl", "<cmd>tabprev<cr>", desc = "Prev Tab" },
		},
		{ "<leader>T", group = "Treesitter" },
		{ "<leader>w", proxy = "<c-w>", group = "Windows" },
		{ "<leader>q", "<cmd>confirm q<CR>", desc = "Quit" },
		-- { "<leader>;", "<cmd>tabnew | terminal<CR>", desc = "Terminal" },

		{ "gd", desc = "Go to Definition", icon = "" },
		{ "gD", desc = "Go to Declaration", icon = "" },
		{ "go", desc = "Go to Type Definition", icon = "" },
		{ "gv", desc = "Last Visual Selection", icon = "~" },
		-- { "za", desc = "Fold", icon = "" },
		-- { "zA", desc = "Fold recursively", icon = "" },
		-- { "zd", desc = "Delete fold", icon = "⯇" },
		-- { "zD", desc = "Delete folds recursively", icon = "⯇" },
		-- { "zf", desc = "Make Fold", icon = "⯈" },
		-- { "zM", desc = "Fold all", icon = "⯆" },
		-- { "zR", desc = "Unfold all", icon = "⯅" },
		-- { "zx", desc = "Update folds", icon = "⟳" },
	}

	which_key.setup({
		preset = "helix",
		triggers = { "<auto>", mode = "ns" },
		win = { width = 0.5 },
		spec = spec,
		plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = true,
				suggestions = 10,
			},
			presets = {
				operators = false,
				motions = false,
				text_objects = true,
				z = false,
				g = false,
			},
		},
		filter = function(mapping)
			-- example to exclude mappings without a description
			return mapping.desc and mapping.desc ~= ""
		end,
		show_help = false,
		show_keys = false,
		disable = {
			buftypes = {},
			filetypes = { "TelescopePrompt" },
		},
	})

	-- local opts = {
	-- 	mode = "n",
	-- 	prefix = "<leader>",
	-- }
	--
	-- which_key.register(mappings, opts)
end

return M
