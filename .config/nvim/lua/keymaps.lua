local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable the spacebar key's default behavior in Normal and Visual modes
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- clear highlights
map("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear highlights" })

-- save file
map("n", "<leader>s", "<cmd> w<CR>", { desc = "Save file" })

-- quit neovim
map("n", "<leader>qq", "<cmd> qa <CR>", { desc = "Quit neovim" })

-- quit file
map("n", "<leader>qf", "<cmd> q <CR>", { desc = "Quit file" })

-- delete single character without copying into register
map("n", "x", '"_x')

-- Vertical scroll and center
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- find and center
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- general
map("n", "0", "^", { desc = "Jump to first character" })

-- keep last yanked when pasting
map("v", "p", "_dP")
map("x", "p", "P")

-- stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Resize with arrows
map("n", "<Up>", ":resize -2<CR>", { desc = "Resize up" })
map("n", "<Down>", ":resize +2<CR>", { desc = "Resize down" })
map("n", "<Left>", ":vertical resize -2<CR>", { desc = "Resize left" })
map("n", "<Right>", ":vertical resize +2<CR>", { desc = "Resize right" })

-- windows
map("n", "<leader>wh", "<C-W>v", { desc = "Split window horizontal" })
map("n", "<leader>wv", "<C-W>s", { desc = "Split window vertical" })
map("n", "<leader>we", "<C-w>=", { desc = "Equal split size" })
map("n", "<leader>ws", ":close<CR>", { desc = "Close split window" })

-- buffers
map("n", "<leader>x", "<cmd>bdelete!<CR>", { desc = "Close buffer" })
map("n", "H", "<cmd>bprev<CR>", { desc = "Previous buffer" })
map("n", "L", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader><leader>", "<c-^>", { desc = "Last buffer" })

-- Move text up and down
map("v", "<A-j>", ":m .+1<CR>==", { desc = "Move text up" })
map("v", "<A-k>", ":m .-2<CR>==", { desc = "Move text down" })

-- open lazygit in tmux window
map("n", "<leader>gg", "<cmd>!tmux new-window -c " .. vim.fn.getcwd() .. " -- lazygit <CR><CR>", { desc = "Lazygit" })
