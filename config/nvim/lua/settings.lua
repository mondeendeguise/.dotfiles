local o = vim.o
local g = vim.g

o.tabstop = 4
o.softtabstop = 2
o.shiftwidth = 2
o.smarttab = true
o.expandtab = true
o.autoindent = true

o.hlsearch = false
o.incsearch = true
o.splitright = true

o.laststatus = 2

-- don't automatically insert completion items until one is explicitly selected
o.completeopt = 'menuone,noinsert'
-- completion menu size max
o.pumheight = 7

-- Folds
-- fill fold text with spaces
o.fillchars = 'fold: '
o.foldlevelstart = 99
o.foldmethod = 'marker'
o.foldmarker = '{{{,}}}'

o.nu = true
o.relativenumber = true
o.numberwidth = 2
o.cursorline = true
o.scrolloff = 8
o.guicursor = ''
o.wrap = false

o.spell = false

o.termguicolors = true
o.background = 'dark'

g.mapleader = ','

g.loaded = 1
g.loaded_netrwPlugin = 1
