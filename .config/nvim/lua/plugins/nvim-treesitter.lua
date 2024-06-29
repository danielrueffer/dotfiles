return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
		"RRethy/nvim-treesitter-endwise",
		"nvim-treesitter/nvim-treesitter-context",
	},
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {
				"bash",
				"embedded_template",
				"javascript",
				"html",
				"markdown",
				"markdown_inline",
				"regex",
				"ruby",
				"vim",
				"vimdoc",
				"xml",
				"yaml",
			},
			auto_install = true,
			highlight = {
				enable = true,
				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			autotag = {
				enable = true,
				filetypes = { "html", "xml", "eruby", "erb", "embedded_template" },
			},
			autopairs = { enable = true },
			endwise = { enable = true },
		})

		require("treesitter-context").setup()
	end,
}
