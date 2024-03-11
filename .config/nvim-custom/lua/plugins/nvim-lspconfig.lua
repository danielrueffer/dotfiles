return {
	"neovim/nvim-lspconfig",
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
			auto_install = true,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local lspconfig = require("lspconfig")
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
		})

		-- textDocument/diagnostic support until 0.10.0 is released
		-- local _timers = {}
		-- local function setup_diagnostics(client, buffer)
		-- 	if require("vim.lsp.diagnostic")._enable then
		-- 		return
		-- 	end
		--
		-- 	local diagnostic_handler = function()
		-- 		local params = vim.lsp.util.make_text_document_params(buffer)
		-- 		client.request("textDocument/diagnostic", { textDocument = params }, function(err, result)
		-- 			if err then
		-- 				local err_msg = string.format("diagnostics error - %s", vim.inspect(err))
		-- 				vim.lsp.log.error(err_msg)
		-- 			end
		-- 			local diagnostic_items = {}
		-- 			if result then
		-- 				diagnostic_items = result.items
		-- 			end
		-- 			vim.lsp.diagnostic.on_publish_diagnostics(
		-- 				nil,
		-- 				vim.tbl_extend("keep", params, { diagnostics = diagnostic_items }),
		-- 				{ client_id = client.id }
		-- 			)
		-- 		end)
		-- 	end
		--
		-- 	diagnostic_handler() -- to request diagnostics on buffer when first attaching
		--
		-- 	vim.api.nvim_buf_attach(buffer, false, {
		-- 		on_lines = function()
		-- 			if _timers[buffer] then
		-- 				vim.fn.timer_stop(_timers[buffer])
		-- 			end
		-- 			_timers[buffer] = vim.fn.timer_start(200, diagnostic_handler)
		-- 		end,
		-- 		on_detach = function()
		-- 			if _timers[buffer] then
		-- 				vim.fn.timer_stop(_timers[buffer])
		-- 			end
		-- 		end,
		-- 	})
		-- end
		--
		-- lspconfig.ruby_ls.setup({
		-- 	capabilities = capabilities,
		-- 	command_path = "~/.rbenv/shims/ruby-lsp",
		-- 	filetypes = { "ruby", "rakefile" },
		-- 	on_attach = function(client, buffer)
		-- 		setup_diagnostics(client, buffer)
		-- 	end,
		-- })

		-- configure solargraph server for ruby
		lspconfig.solargraph.setup({
			capabilities = capabilities,
			filetypes = { "ruby", "rakefile" },
			root_dir = lspconfig.util.root_pattern("Gemfile", ".git"),
			command_path = "~/.rbenv/shims/solargraph",
			settings = {
				solargraph = {
					autoformat = false,
					formatting = false,
					completion = true,
					definition = true,
					hover = true,
					diagnostic = true,
					folding = true,
					references = true,
					rename = true,
					symbols = true,
				},
			},
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
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
			end,
		})

		-- Configure borderd for LspInfo ui
		require("lspconfig.ui.windows").default_options.border = "rounded"
	end,
}
