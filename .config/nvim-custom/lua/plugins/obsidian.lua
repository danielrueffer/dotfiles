return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "notes",
				path = "/Users/daniel/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes",
			},
		},
	},
}
