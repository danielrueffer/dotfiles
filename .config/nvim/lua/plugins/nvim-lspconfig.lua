return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",

		-- Install neodev for better nvim configuration and plugin authoring via lsp configurations
		"folke/neodev.nvim",

		-- Progress/Status update for LSP
		{ "j-hui/fidget.nvim", tag = "legacy" },
	},
	config = function()
		-- Use neodev to configure lua_ls in nvim directories - must load before lspconfig
		require("neodev").setup()

		require("mason").setup({
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls" },
		})

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local lspconfig = require("lspconfig")
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
		})

		-- configure solargraph server for ruby
		-- lspconfig.solargraph.setup({
		-- 	capabilities = capabilities,
		-- 	filetypes = { "ruby", "rakefile" },
		-- 	root_dir = lspconfig.util.root_pattern("Gemfile", ".git"),
		-- 	command_path = "~/.rbenv/shims/solargraph",
		-- 	settings = {
		-- 		solargraph = {
		-- 			autoformat = false,
		-- 			formatting = false,
		-- 			completion = true,
		-- 			definition = true,
		-- 			hover = true,
		-- 			diagnostic = false,
		-- 			folding = true,
		-- 			references = true,
		-- 			rename = true,
		-- 			symbols = true,
		-- 		},
		-- 	},
		-- })

		-- configure ruby_lsp server for ruby
		lspconfig.ruby_lsp.setup({
			capabilities = capabilities,
			root_dir = lspconfig.util.root_pattern("Gemfile", ".git"),
			command_path = "~/.rbenv/shims/ruby-lsp",
		})

		-- Use LspAttach autocommand to only map the following keys
		-- after the language server attaches to the current buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "gf", vim.lsp.buf.format, opts)
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set({ "n", "v" }, "<leader>rn", vim.lsp.buf.rename, opts)
			end,
		})

		-- Configure borderd for LspInfo ui
		require("lspconfig.ui.windows").default_options.border = "rounded"
	end,
}
