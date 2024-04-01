local keymap = vim.keymap -- for conciseness

-- general
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "0", "^", { desc = "Goto first non empty character in line" })
keymap.set("n", "<esc>", ":nohl<CR>", { desc = "Clear search highlights", noremap = true, silent = true })
keymap.set("n", "<leader>qq", "<cmd> qa <CR>", { desc = "Close neovim" })
keymap.set("v", "p", "_dP", { desc = "Paste without yanking" })
keymap.set("x", "p", "P", { desc = "Paste without yanking" })
keymap.set("v", "<", "<gv", { desc = "Remove indent" })
keymap.set("v", ">", ">gv", { desc = "Add indent" })

-- windows
keymap.set("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
keymap.set("n", "<leader>w|", "<C-W>v", { desc = "Split window right" })
keymap.set("n", "<leader>w-", "<C-W>s", { desc = "Split window below" })
keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split window right" })
keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split window below" })

-- buffers
keymap.set("n", "<leader>bw", "<cmd> w <CR>", { desc = "Write buffer" })
keymap.set("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Delete buffer" })
keymap.set("n", "H", "<cmd>bprev<CR>", { desc = "Previous buffer" })
keymap.set("n", "L", "<cmd>bnext<CR>", { desc = "Next buffer" })
-- Switch between current and previous buffer
keymap.set("n", "<leader><leader>", "<c-^>", { desc = "Previous buffer", noremap = true, silent = true })

-- write file
keymap.set("n", "<leader>s", ":w<cr>", { desc = "[S]ave current file" })
