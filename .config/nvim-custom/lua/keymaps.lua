local keymap = vim.keymap -- for conciseness

-- general
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "0", "^", { desc = "Goto first non empty character in line" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<leader>qq", "<cmd> qa <CR>", { desc = "Close neovim" })
keymap.set("v", "p", "_dP", { desc = "Paste without yanking" })

-- windows
keymap.set("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
keymap.set("n", "<leader>w|", "<C-W>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>w-", "<C-W>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split window vertically" })

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close current split" })

keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- buffers
keymap.set("n", "<leader>w", "<cmd> w <CR>", { desc = "Write buffer" })
keymap.set("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Delete buffer" })
keymap.set("n", "H", "<cmd>bprev<CR>", { desc = "Previous buffer" })
keymap.set("n", "L", "<cmd>bnext<CR>", { desc = "Next buffer" })

