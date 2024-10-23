local M = {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
		{
			"nvim-telescope/telescope-project.nvim",
			dependencies = { "nvim-telescope/telescope-file-browser.nvim" },
		},
	},
}

function M.config()
	local icons = require("user.icons")
	local actions = require("telescope.actions")
	local wk = require("which-key")
	wk.add({
		{ "<leader>ff", desc = "Files", icon = icons.ui.File },
		{ "<leader>fg", desc = "Grep working directory", icon = icons.ui.Search },
		{ "<leader>fr", desc = "Recent files", icon = icons.ui.FindFile },
		{ "<leader>f'", desc = "Registers", icon = icons.ui.Table },
		{ "<leader>f<leader>", desc = "Buffers", icon = icons.ui.Files },
		{ "<leader>fn", desc = "Nvim config", icon = icons.ui.Gear },
		{ "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Keymaps", icon = icons.misc.CircuitBoard },
		-- { "<leader>fp", "<cmd>Telescope projects<CR>", desc = "Projects", icon = icons.git.Repo },
		{
			"<leader>fp",
			":lua require'telescope'.extensions.project.project{}<CR>",
			desc = "Projects",
			icon = icons.git.Repo,
		},
	})
	require("telescope").setup({
		defaults = {
			-- prompt_prefix = icons.ui.Telescope .. " ",
			-- selection_caret = icons.ui.Forward .. " ",
			entry_prefix = "   ",
			initial_mode = "insert",
			selection_strategy = "reset",
			path_display = { "smart" },
			color_devicons = true,
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--hidden",
				"--glob=!.git/",
			},

			mappings = {
				i = {
					["<C-n>"] = actions.cycle_history_next,
					["<C-p>"] = actions.cycle_history_prev,

					["<C-j>"] = actions.move_selection_next,
					["<C-k>"] = actions.move_selection_previous,
				},
				n = {
					["<esc>"] = actions.close,
					["j"] = actions.move_selection_next,
					["k"] = actions.move_selection_previous,
					["q"] = actions.close,
				},
			},
		},
		pickers = {
			live_grep = {
				theme = "dropdown",
				prompt_title = vim.fn.getcwd():gsub("(.*\\)(.*\\.*\\.*)", "~\\%2"),
			},

			current_buffer_fuzzy_find = {
				theme = "dropdown",
			},

			grep_string = {
				theme = "dropdown",
			},

			find_files = {
				theme = "dropdown",
				previewer = false,
			},

			buffers = {
				theme = "dropdown",
				previewer = false,
				initial_mode = "normal",
				mappings = {
					i = {
						["<C-d>"] = actions.delete_buffer,
					},
					n = {
						["dd"] = actions.delete_buffer,
					},
				},
			},

			planets = {
				show_pluto = true,
				show_moon = true,
			},

			colorscheme = {
				enable_preview = true,
			},

			lsp_references = {
				theme = "dropdown",
				initial_mode = "normal",
			},

			lsp_definitions = {
				theme = "dropdown",
				initial_mode = "normal",
			},

			lsp_declarations = {
				theme = "dropdown",
				initial_mode = "normal",
			},

			lsp_implementations = {
				theme = "dropdown",
				initial_mode = "normal",
			},
			lsp_document_symbols = {
				theme = "dropdown",
				initial_mode = "normal",
			},
			lsp_workspace_symbols = {
				theme = "dropdown",
				initial_mode = "normal",
			},
			diagnostics = {
				theme = "dropdown",
				initial_mode = "normal",
			},
		},
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			},
		},
	})
	pcall(require("telescope").load_extension, "fzf")
	pcall(require("telescope").load_extension, "ui-select")
	pcall(require("telescope").load_extension, "project")
	-- See `:help telescope.builtin`
	local builtin = require("telescope.builtin")
	vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Files" })
	-- vim.keymap.set("n", "<leader>ft", builtin.current_buffer_fuzzy_find, { desc = "Fuzzy find text in buffer" })
	vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep working directory" })
	-- vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Keymaps" })
	vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recently opened files" })
	vim.keymap.set("n", "<leader>f<leader>", builtin.buffers, { desc = "Buffers" })
	vim.keymap.set("n", "<leader>f'", builtin.registers, { desc = "Registers" })
	-- Shortcut for searching your Neovim configuration files
	vim.keymap.set("n", "<leader>fn", function()
		builtin.find_files({ cwd = vim.fn.stdpath("config") })
	end, { desc = "Config" })
end

return M
