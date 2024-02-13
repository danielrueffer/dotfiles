local opt = vim.opt -- for conciseness

-- Set leader key to space
vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

-- set tabs to 2 spaces
opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true

-- enable auto indenting and set it to spaces
opt.smartindent = true
opt.shiftwidth = 2

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  { "rebelot/kanagawa.nvim", name = "kanagawa", priority = 1000 },

  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
      dependencies = { 'nvim-lua/plenary.nvim' }
  },

  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"}
}
local opts = {}

require("lazy").setup(plugins, opts)
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {"lua"},
  highlight = { enable = true },
  indent = { enable = true },
})

require("kanagawa").setup()
vim.cmd.colorscheme "kanagawa"
