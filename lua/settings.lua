local set = vim.opt
local setglob = vim.g

setglob.mapleader = ' '
set.termguicolors = true
set.syntax = 'on'
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true
set.relativenumber = true
set.number = true
set.hlsearch = false
set.hidden = true
set.ignorecase = true
set.smartcase = true
set.incsearch = true
set.smartindent = true
set.swapfile = false
set.backup = false
set.undodir = '~/.vim/undodir'
set.scrolloff = 10
set.showmode = false
set.completeopt = 'menuone,noinsert,noselect'
set.signcolumn = 'yes'
set.wrap = false

vim.cmd[[colorscheme nord]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
