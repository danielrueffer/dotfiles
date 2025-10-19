-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
-- local opts = { noremap = true, silent = true }

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Open lazygit in a new tmux window
vim.keymap.set(
  "n",
  "<leader>gg",
  "<cmd>!tmux new-window -c " .. vim.fn.getcwd() .. " -- lazygit <CR><CR>",
  { desc = "Lazygit" }
)

-- Open lazydocker in a new tmux window
vim.keymap.set(
  "n",
  "<leader>dd",
  "<cmd>!tmux new-window -c " .. vim.fn.getcwd() .. " -- lazydocker <CR><CR>",
  { desc = "Lazydocker" }
)
