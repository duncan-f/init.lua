local set = vim.opt
vim.notify = require("notify")

vim.g.mapleader = ","

-- Set the behavior of tab
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true

set.compatible = false
set.mouse = "a"
set.clipboard = "unnamedplus"
set.encoding = "UTF-8"
set.wildmode = "longest,list,full"

set.nu = true
set.rnu = true
set.encoding = 'UTF-8'

set.swapfile = false
set.backup = false
set.undodir = vim.fn.stdpath("config") .. "/undodir"
set.undofile = true

set.smartindent = true

set.incsearch = true
set.hlsearch = false

set.splitbelow = true
set.splitright = true

set.scrolloff = 8
set.signcolumn = "yes"
set.isfname:append("@-@")

set.updatetime = 50
set.colorcolumn = '80'
set.termguicolors = true

set.bg = 'dark'
