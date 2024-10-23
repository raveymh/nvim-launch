local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "n", "nzz", opts)
vim.keymap.set("n", "N", "Nzz", opts)
vim.keymap.set("n", "*", "*zz", opts)
vim.keymap.set("n", "#", "#zz", opts)
vim.keymap.set("n", "g*", "g*zz", opts)
vim.keymap.set("n", "g#", "g#zz", opts)
-- keep indenting
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)
-- keep pasting
vim.keymap.set("x", "p", [["_dP]])
-- go start/end of line
vim.keymap.set({ "n", "o", "x" }, "<s-h>", "^", opts)
vim.keymap.set({ "n", "o", "x" }, "<s-l>", "g_", opts)
vim.keymap.set({ "n", "i" }, "<C-s>", "<Esc><cmd>w<CR>", opts)
vim.keymap.set({ "n", "v" }, "zs", ":%s@", opts)
vim.keymap.set({ "v", "x" }, "zS", ":s@", opts)
vim.keymap.set("n", "<C-f>", "/", opts)
vim.keymap.set({ "n", "v", "x", "o" }, "q", "<Nop>") -- stop macro
vim.keymap.set({ "n", "v", "x" }, "+", "<C-a>", opts)
vim.keymap.set({ "n", "v", "x" }, "_", "<C-x>", opts)
vim.keymap.set("n", "<C-a>", "ggVG", opts) -- select all

vim.keymap.set({ "n", "v" }, "<C-d>", "}")
vim.keymap.set({ "n", "v" }, "<C-u>", "{")
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })

-- mousemenu
vim.cmd([[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]])
vim.cmd([[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]])
vim.cmd([[:amenu 10.120 mousemenu.-sep- *]])

vim.keymap.set("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
