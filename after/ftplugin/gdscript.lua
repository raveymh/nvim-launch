vim.keymap.set({ "n" }, "<leader>ol", "<cmd>!gdlint %<CR>", { desc = "Lint list" })
vim.opt_local.foldmethod = "expr"

vim.keymap.set({ "n" }, "<leader>oa", "<cmd>GodotRunLast<CR>", { desc = "Run last scene" })
vim.keymap.set({ "n" }, "<leader>or", "<cmd>GodotRun<CR>", { desc = "Run default scene" })
vim.keymap.set({ "n" }, "<leader>oe", "<cmd>GodotRunCurrent<CR>", { desc = "Run current scene" })
vim.keymap.set({ "n" }, "<leader>os", "<cmd>GodotRunFZF<CR>", { desc = "Run select scene" })

-- NOTE: Display code order from style guide
-- Display window reference
local win_id = nil
local buf_id = nil

function DisplayCodeOrder()
	if win_id and vim.api.nvim_win_is_valid(win_id) then
		vim.api.nvim_win_close(win_id, true)
		win_id = nil
		buf_id = nil
		return
	end

	local code_structure = [[
  01. @tool
  02. class_name
  03. extends
  04. # docstring

  05. signals
  06. enums
  07. constants
  08. @export variables
  09. public variables
  10. private variables
  11. @onready variables

  12. optional built-in virtual _init method
  13. optional built-in virtual _enter_tree() method
  14. built-in virtual _ready method
  15. remaining built-in virtual methods
  16. public methods
  17. private methods
  18. subclasses
  ]]

	buf_id = vim.api.nvim_create_buf(false, true) -- scratch buffer
	vim.api.nvim_buf_set_lines(buf_id, 0, -1, false, vim.split(code_structure, "\n"))

	-- Create a floating window
	local width = vim.o.columns
	local height = vim.o.lines
	local win_width = math.floor(width * 0.4)
	local win_height = math.floor(height * 0.5)
	local row = math.floor((height - win_height) / 2)
	local col = math.floor((width - win_width) / 2)

	local opts = {
		style = "minimal",
		relative = "editor",
		width = win_width,
		height = win_height,
		row = row,
		col = col,
		border = "double",
	}

	win_id = vim.api.nvim_open_win(buf_id, true, opts)

	-- Close window
	vim.api.nvim_buf_set_keymap(buf_id, "n", "<Esc>", "<cmd>q<CR>", { noremap = true, silent = true })
	vim.api.nvim_buf_set_keymap(buf_id, "n", "q", "<cmd>q<CR>", { noremap = true, silent = true })
end

vim.api.nvim_create_user_command("DisplayCodeOrder", DisplayCodeOrder, {})
vim.keymap.set({ "n", "v" }, "<leader>oo", "<cmd>DisplayCodeOrder<CR>", { desc = "Code order" })
