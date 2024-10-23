return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v4.x",
	dependencies = {
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "neovim/nvim-lspconfig" },
		{ "L3MON4D3/LuaSnip" },
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lsp-signature-help" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "rafamadriz/friendly-snippets" },
	},

	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(event)
				local opts = { buffer = event.buf }
				vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
				vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)
				vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
				vim.keymap.set("n", "gi", "<cmd>Telescope implementations<cr>", opts)
				vim.keymap.set("n", "go", "<cmd>Telescope type_definitions<cr>", opts)
				vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
				vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
				vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
				vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
				-- vim.keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
				-- vim.keymap.set("n", "<leader>ll", "<cmd>lua vim.lsp.buf.codelens.run()<cr>", opts)

				local wk = require("which-key")
				wk.add({
					{ "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code actions" },
					{ "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
					{ "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
					{ "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix" },
				})
			end,
		})

		local icons = require("user.icons")
		local lspconfig_defaults = require("lspconfig").util.default_config
		lspconfig_defaults.capabilities = vim.tbl_deep_extend(
			"force",
			lspconfig_defaults.capabilities,
			require("cmp_nvim_lsp").default_capabilities()
		)

		local default_diagnostic_config = {
			signs = {
				active = true,
				values = {
					{ name = "DiagnosticSignError", text = icons.diagnostics.Error },
					{ name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
					{ name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
					{ name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
				},
			},
			virtual_text = false,
			update_in_insert = false,
			underline = true,
			severity_sort = true,
			float = {
				focusable = true,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		}

		vim.diagnostic.config(default_diagnostic_config)
		local diagnostic_config = vim.diagnostic.config() or {}
		for _, sign in ipairs(vim.tbl_get(diagnostic_config, "signs", "values") or {}) do
			vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
		end

		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
		vim.lsp.handlers["textDocument/signatureHelp"] =
			vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

		local lsp_zero = require("lsp-zero")
		require("mason").setup({})
		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local opts = {}
					opts.on_attach = function(client, bufnr)
						if client.supports_method("textDocument/inlayHint") then
							vim.lsp.inlay_hint.enable(true)
						end
					end

					local require_ok, settings = pcall(require, "user.lspsettings." .. server_name)
					if require_ok then
						opts = vim.tbl_deep_extend("force", settings, opts)
					end

					lsp_zero.client_config(opts)
					require("lspconfig")[server_name].setup({})
				end,
			},
		})

		local gdscript_config = {
			capabilities = lspconfig_defaults.capabilities,
			settings = {},
			filetypes = { "gd", "gdscript" },
		}
		if vim.fn.has("win32") == 1 then
			-- Windows specific. Requires nmap installed (`winget install nmap`)
			gdscript_config["cmd"] = { "ncat", "localhost", os.getenv("GDScript_Port") or "6005" }
		end
		require("lspconfig").gdscript.setup(gdscript_config)

		local cmp = require("cmp")
		local cmp_action = lsp_zero.cmp_action()

		-- this is the function that loads the extra snippets
		-- from rafamadriz/friendly-snippets
		require("luasnip.loaders.from_vscode").lazy_load()

		-- cmp.setup({
		-- 	preselect = "item",
		-- 	completion = {
		-- 		autocomplete = false,
		-- 		-- completeopt = "menu,menuone,noinsert",
		-- 	},
		-- 	sources = {
		-- 		-- { name = "path" },
		-- 		-- { name = "nvim_lsp" },
		-- 		-- { name = "luasnip", keyword_length = 2 },
		-- 		-- { name = "buffer", keyword_length = 3 },
		-- 		{ name = "nvim_lsp_signature_help" },
		-- 	},
		-- 	window = {
		-- 		-- completion = cmp.config.window.bordered(),
		-- 		-- documentation = cmp.config.window.bordered(),
		-- 	},
		-- 	snippet = {
		-- 		expand = function(args)
		-- 			require("luasnip").lsp_expand(args.body)
		-- 		end,
		-- 	},
		-- 	mapping = cmp.mapping.preset.insert({
		-- 		-- tab complete
		-- 		-- ["<Tab>"] = cmp_action.tab_complete(),
		-- 		-- ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
		--
		-- 		-- confirm completion item
		-- 		-- ["<Enter>"] = cmp.mapping.confirm({ select = true }),
		--
		-- 		-- trigger completion menu
		-- 		["<C-Space>"] = cmp.mapping.complete(),
		--
		-- 		-- -- scroll up and down the documentation window
		-- 		-- ["<C-u>"] = cmp.mapping.scroll_docs(-4),
		-- 		-- ["<C-d>"] = cmp.mapping.scroll_docs(4),
		-- 		--
		-- 		-- -- navigate between snippet placeholders
		-- 		-- ["<C-f>"] = cmp_action.luasnip_jump_forward(),
		-- 		-- ["<C-b>"] = cmp_action.luasnip_jump_backward(),
		-- 	}),
		-- 	-- NOTE: if you are going to use lsp-kind (another plugin)
		-- 	-- replace the line below with the function from lsp-kind
		-- 	-- formatting = lsp_zero.cmp_format({ details = true }),
		-- })
	end,
}
