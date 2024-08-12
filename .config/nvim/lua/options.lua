local opt = vim.opt -- for conciseness

-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

-- line numbers
opt.relativenumber = true
opt.number = true

-- set tabs to 2 spaces
opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true
opt.autoindent = true

-- enable auto indenting and set it to spaces
opt.smartindent = true
opt.shiftwidth = 2

-- Enable smart indenting (see https://stackoverflow.com/questions/1204149/smart-wrap-in-vim)
opt.breakindent = true

-- disable text wrap
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- enable incremental searching
opt.incsearch = true
opt.hlsearch = true

-- appearence
opt.termguicolors = true

-- clipboard
opt.clipboard:append("unnamedplus")

-- backspace
opt.backspace = "indent,eol,start"

-- split windows
opt.splitright = true
opt.splitbelow = true

-- consider hello-hello as one word
opt.iskeyword:append("-")

-- enable mousse mode
opt.mouse = "a"

-- enable cursor line highlight
opt.cursorline = true

-- enable signcolumn
opt.signcolumn = "yes"

-- Set completeopt to have a better completion experience
opt.completeopt = { "menuone", "noselect" }

-- Enable persistent undo history
opt.undofile = true

-- Always keep 8 lines above/below cursor unless at start/end of file
opt.scrolloff = 8

opt.guicursor = {
	"n-v-c:block", -- Normal, visual, command-line: block cursor
	"i-ci-ve:ver25", -- Insert, command-line insert, visual-exclude: vertical bar cursor with 25% width
	"r-cr:hor20", -- Replace, command-line replace: horizontal bar cursor with 20% height
	"o:hor50", -- Operator-pending: horizontal bar cursor with 50% height
	"a:blinkwait700-blinkoff400-blinkon250", -- All modes: blinking settings
	"sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch: block cursor with specific blinking settings
}
