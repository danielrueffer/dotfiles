return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local wk = require("which-key")

		local opt = { prefix = "<leader>" }

		local mappings = {
			b = { name = "Buffer" },
			c = { name = "Code" },
			f = { name = "Find" },
			g = { name = "Git" },
			n = { name = "Notifications" },
			q = { name = "Quit" },
		}

		wk.register(mappings, opt)
	end,
}
