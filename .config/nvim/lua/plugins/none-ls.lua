return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"jay-babu/mason-null-ls.nvim",
	},
	config = function()
		local mason_null_ls = require("mason-null-ls")
		mason_null_ls.setup({
			ensure_installed = {
				"stylua", -- lua formatter
			},
			auto_install = true,
		})

		-- to setup format on save
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.rubocop.with({
					command = "bundle",
					args = vim.list_extend(
						{ "exec", "rubocop" },
						require("null-ls").builtins.formatting.rubocop._opts.args
					),
				}),
				null_ls.builtins.diagnostics.rubocop.with({
					command = "bundle",
					args = vim.list_extend(
						{ "exec", "rubocop" },
						require("null-ls").builtins.diagnostics.rubocop._opts.args
					),
				}),
			},
			-- configure format on save
			on_attach = function(current_client, bufnr)
				if current_client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(client)
									--  only use null-ls for formatting instead of lsp server
									return client.name == "null-ls"
								end,
								bufnr = bufnr,
							})
						end,
					})
				end
			end,
		})

		vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format" })
	end,
}
