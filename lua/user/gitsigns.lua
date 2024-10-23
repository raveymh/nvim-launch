return {
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",

		opts = {
			signs = {
				add = { text = "+"},
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			signs_staged = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			signcolumn = true,

			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- normal mode
				map("n", "<leader>gS", gitsigns.stage_hunk, { desc = "Stage hunk" })
				map("n", "<leader>gR", gitsigns.reset_hunk, { desc = "Reset hunk" })
				map("n", "<leader>gs", gitsigns.stage_buffer, { desc = "Stage buffer" })
				map("n", "<leader>gu", gitsigns.undo_stage_hunk, { desc = "Undo stage hunk" })
				map("n", "<leader>gr", gitsigns.reset_buffer, { desc = "Reset buffer" })
				map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Preview hunk" })
				map("n", "<leader>gb", gitsigns.blame_line, { desc = "Blame line" })
				map("n", "<leader>gD", gitsigns.diffthis, { desc = "Diff against index" })
				map("n", "<leader>gd", function()
					gitsigns.diffthis("@")
				end, { desc = "Diff against last commit" })
				-- Toggles
				map("n", "<leader>gtb", gitsigns.toggle_current_line_blame, { desc = "Git-blame" })
				map("n", "<leader>gtd", gitsigns.toggle_deleted, { desc = "Deleted" })
				map("n", "<leader>gtl", gitsigns.toggle_linehl, { desc = "Line highlight" })
				map("n", "<leader>gtt", gitsigns.toggle_signs, { desc = "Gitsigns" })
			end,
		},
	},
}
