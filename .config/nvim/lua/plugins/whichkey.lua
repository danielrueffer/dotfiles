return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	keys = {
		{ "<leader>b", group = "Buffer" },
		{ "<leader>c", group = "Code" },
		{ "<leader>e", group = "Explorer" },
		{ "<leader>f", group = "Find" },
		{ "<leader>g", group = "Git" },
		{ "<leader>n", group = "Notifications" },
		{ "<leader>q", group = "Quit" },
	},
}
