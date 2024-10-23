local M = {
	"goolord/alpha-nvim",
	event = "VimEnter",
}

function M.config()
	local icons = require("user.icons")
	local theta = require("alpha.themes.theta")
	local config = theta.config
	config.layout[4].val[3] = {
		type = "group",
		val = function()
			return { require("alpha.themes.theta").mru(0, vim.fn.getcwd(), 6) }
		end,
		opts = { shrink_margin = false, margin = 0 },
	}
	-- print(Dump(config.layout[6].val[7]["opts"]))
	config.layout[6].val[7]["val"] = icons.misc.Package .. " Lazy"
	config.layout[6].val[7]["opts"]["keymap"][3] = "<cmd>Lazy<cr>"
	config.layout[6].val[7]["opts"]["shortcut"] = "u"
	config.layout[6].val[6]["opts"]["keymap"][3] = "<cmd>e $MYVIMRC<cr>"
	require("alpha").setup(config)

	-- vim.api.nvim_create_autocmd("User", {
	--     pattern = "LazyVimStarted",
	--     callback = function()
	--         local stats = require("lazy").stats()
	--         local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
	--         theta.header.val = "Loaded " .. stats.count .. " plugins in " .. ms .. "ms"
	--         pcall(vim.cmd.AlphaRedraw)
	--     end,
	-- })
end

return M
