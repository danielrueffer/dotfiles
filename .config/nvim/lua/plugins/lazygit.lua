return {
	"kdheepak/lazygit.nvim",
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	-- optional for floating window border decoration
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	-- setting the keybinding for LazyGit with 'keys' is recommended in
	-- order to load the plugin when the command is run for the first time
	keys = {
		-- { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		{
			"<leader>gg",
			":!tmux new-window -c " .. vim.fn.getcwd() .. " -- lazygit <CR><CR>",
			silent = true,
			desc = "Open lazy git",
		},
	},
}
