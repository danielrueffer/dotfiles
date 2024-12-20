return {
	"nvim-neotest/neotest",
	dependencies = {
		"olimorris/neotest-rspec",
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		adapters = {},
		diagnostic = {
			enabled = true,
			severity = 1,
		},
		status = {
			virtual_text = true,
		},
		output = {
			open_on_run = true,
		},
	},
	config = function(_, opts)
		vim.diagnostic.config({
			virtual_text = {
				format = function(diagnostic)
					-- Replace newline and tab characters with space for more compact diagnostics
					local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
					return message
				end,
			},
		}, vim.api.nvim_create_namespace("neotest"))

		opts.adapters = {
			require("neotest-rspec")({
				rspec_cmd = function()
					return vim.tbl_flatten({
						"bin/test",
					})
				end,

				transform_spec_path = function(path)
					local prefix = require("neotest-rspec").root(path)
					return string.sub(path, string.len(prefix) + 2, -1)
				end,

				results_path = "tmp/rspec.output",
				formatter = "json",
			}),
		}

		require("neotest").setup(opts)
	end,
	keys = {
		{
			"<leader>tt",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			desc = "Run File",
		},
		{
			"<leader>tT",
			function()
				require("neotest").run.run(vim.uv.cwd())
			end,
			desc = "Run All Test Files",
		},
		{
			"<leader>tr",
			function()
				require("neotest").run.run()
			end,
			desc = "Run Nearest",
		},
		{
			"<leader>tl",
			function()
				require("neotest").run.run_last()
			end,
			desc = "Run Last",
		},
		{
			"<leader>ts",
			function()
				require("neotest").summary.toggle()
			end,
			desc = "Toggle Summary",
		},
		{
			"<leader>to",
			function()
				require("neotest").output.open({ enter = true, auto_close = true })
			end,
			desc = "Show Output",
		},
		{
			"<leader>tO",
			function()
				require("neotest").output_panel.toggle()
			end,
			desc = "Toggle Output Panel",
		},
		{
			"<leader>tS",
			function()
				require("neotest").run.stop()
			end,
			desc = "Stop",
		},
		{
			"<leader>tw",
			function()
				require("neotest").watch.toggle(vim.fn.expand("%"))
			end,
			desc = "Toggle Watch",
		},
	},
}
