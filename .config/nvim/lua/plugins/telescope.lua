return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			pickers = {
				buffers = {
					show_all_buffers = true,
					sort_lastused = true,
					sort_mru = true,
					previewer = false,
					theme = "dropdown",
					mappings = {
						i = {
							["<C-d>"] = actions.delete_buffer, -- delete selected buffer
						},
					},
				},
			},
			defaults = {
				layout_strategy = "vertical",
				layout_config = {
					vertical = {
						size = {
							width = 0.95,
							height = 0.95,
						},
					},
					horizontal = {
						size = {
							width = 0.95,
							height = 0.95,
						},
					},
				},
				mappings = {
					i = {
						["<esc>"] = actions.close,
						["<C-u>"] = false,
						["<C-j>"] = require("telescope.actions").move_selection_next,
						["<C-k>"] = require("telescope.actions").move_selection_previous,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
				hidden = true,
			},
		})

		telescope.load_extension("fzf")
		-- telescope.load_extension("noice")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set(
			"n",
			"<leader>fa",
			"<cmd>Telescope find_files hidden=true<cr>",
			{ desc = "Find files including hidden files" }
		)
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Find recent files" })
		keymap.set("n", "<leader>fR", "<cmd>Telescope resume<cr>", { desc = "Find recent search" })
		keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
		keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Find symbols in the file" })
		keymap.set("n", "<leader>fu", "<cmd>Telescope undo<cr>", { desc = "Find undo history" })
	end,
}
