return {
	"monkoose/neocodeium",
	event = "VeryLazy",
	config = function()
		local neocodeium = require("neocodeium")
		neocodeium.setup({ manual = false })
		vim.keymap.set("i", "<A-w>", neocodeium.accept)
		vim.keymap.set("i", "<A-c>", neocodeium.cycle_or_complete)
		vim.keymap.set("i", "<A-e>", neocodeium.clear)
		vim.keymap.set(
			{ "n", "i" },
			"<A-i>",
			"<cmd>NeoCodeium toggle<CR>",
			{ desc = "Toggle NeoCodeium", noremap = true }
		)

		-- vim.api.nvim_create_autocmd("User", {
		-- 	pattern = "NeoCodeiumCompletionDisplayed",
		-- 	callback = function()
		--               require("user.blink-cmp").config()
		-- 	end,
		-- })

		vim.api.nvim_create_autocmd("User", {
			pattern = "NeoCodeiumServerConnected",
			callback = function()
				require("neocodeium.commands").disable()
			end,
		})
	end,
}
