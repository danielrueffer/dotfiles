-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Increment/decrement
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
vim.keymap.set("n", "dw", 'vb"_d')

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

vim.keymap.set(
  "n",
  "<leader>gg",
  "<cmd>!tmux new-window -c " .. vim.fn.getcwd() .. " -- lazygit <CR><CR>",
  { desc = "Lazygit" }
)

vim.keymap.set(
  "n",
  "<leader>dd",
  "<cmd>!tmux new-window -c " .. vim.fn.getcwd() .. " -- lazydocker <CR><CR>",
  { desc = "Lazydocker" }
)
