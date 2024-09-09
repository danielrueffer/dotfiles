return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				ruby = { "rubocop" },
			},
			formatters = {
				rubocop = function()
					return {
						command = "bin/rubocop",
						args = {
							"--server",
							"--fix-layout",
							"--autocorrect-all",
							"--format",
							"files",
							"--stderr",
							"--stdin",
							"$FILENAME",
						},
						stdin = true,
					}
				end,
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				lsp_format = "fallback",
				async = false,
				timeout_ms = 1000,
			},
		})
	end,
}
