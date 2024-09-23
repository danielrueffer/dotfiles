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
						command = "bundle",
						args = {
							"exec",
							"rubocop",
							"--server",
							"--autocorrect",
							"--format",
							"quiet",
							"--stderr",
							"--stdin",
							"$FILENAME",
						},
						stdin = true,
					}
				end,
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>cf", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
