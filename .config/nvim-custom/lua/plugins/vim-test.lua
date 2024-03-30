return {
	"vim-test/vim-test",
	dependencies = {
		"preservim/vimux",
	},
	vim.keymap.set("n", "<leader>t", ":TestNearest<CR>", { desc = "Run test nearest" }),
	vim.keymap.set("n", "<leader>T", ":TestFile<CR>", { desc = "Run test file" }),
	vim.keymap.set("n", "<leader>a", ":TestSuite<CR>", { desc = "Run test suite" }),
	vim.keymap.set("n", "<leader>l", ":TestLast<CR>", { desc = "Run test last" }),
	vim.keymap.set("n", "<leader>v", ":TestVisit<CR>", { desc = "Run test last" }),
	vim.cmd("let test#strategy = 'vimux'"),
	vim.cmd("let test#ruby#minitest#executable = 'bin/test'"),
	vim.cmd("let test#ruby#rails#executable = 'bin/test'"),
}
