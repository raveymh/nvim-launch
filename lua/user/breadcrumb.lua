local M = {
	"LunarVim/breadcrumbs.nvim",
}

function M.config()
	local breadcrumbs = require("breadcrumbs")

	vim.cmd([[highlight CustomHL guifg=#C3CCDC ]])
	local function get_filename()
		local filename = vim.fn.expand("%:t")
		local extension = vim.fn.expand("%:e")
		local f = require("breadcrumbs.utils")
		if not f.isempty(filename) then
			local file_icon, hl_group
			local devicons_ok, devicons = pcall(require, "nvim-web-devicons")
			if devicons_ok then
				file_icon, hl_group = devicons.get_icon(filename, extension, { default = true })
				if f.isempty(file_icon) then
					file_icon = ""
				end
				hl_group = "CustomHL" -- Use custom highlight group
			else
				file_icon = ""
				hl_group = "WinBar"
			end
			local buf_ft = vim.bo.filetype
			if buf_ft == "dapui_breakpoints" then
				file_icon = ""
			end
			if buf_ft == "dapui_stacks" then
				file_icon = ""
			end
			if buf_ft == "dapui_scopes" then
				file_icon = ""
			end
			if buf_ft == "dapui_watches" then
				file_icon = ""
			end
			if buf_ft == "dapui_console" then
				file_icon = ""
			end
			return " " .. "%#" .. hl_group .. "#" .. file_icon .. "%* " .. "%#CustomHL#" .. filename .. "%*"
		end
	end

	breadcrumbs.get_filename = get_filename

	breadcrumbs.setup()
	-- require("breadcrumbs").setup()
end

return M
