return {
	"skalnik/vim-vroom",
	dependencies = {
		"preservim/vimux",
	},
	config = function()
		vim.api.nvim_set_var("vroom_use_colors", 1)
		vim.api.nvim_set_var("vroom_clear_screen", 0)
		vim.api.nvim_set_var("vroom_use_vimux", 1)
		vim.api.nvim_set_var("vroom_use_binstubs", 1)
		vim.api.nvim_set_var("vroom_test_unit_command", "test")

		vim.keymap.set("n", "<leader>r", ":VroomRunTestFile<cr>", { desc = "Run test", silent = true })
		vim.keymap.set("n", "<leader>R", ":VroomRunNearestTest<cr>", { desc = "Run nearest test", silent = true })
		vim.keymap.set("n", "<leader>l", ":VroomRunLastTest<cr>", { desc = "Run last test", silent = true })
	end,
}
