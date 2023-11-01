local o = vim.o
local g = vim.g

g.mapleader = " "

o.smarttab = true
o.expandtab = true
o.autoindent = true
o.tabstop = 4
o.softtabstop = 2
o.shiftwidth = 4

o.hlsearch = true
o.incsearch = true

o.laststatus = 2

-- Completion items aren't inserted until explicitly selected
o.completeopt = "menuone,noinsert"
-- Completion menu
o.pumheight = 7

o.foldlevelstart = 99
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
--o.foldmethod = "marker"
--o.foldmarker = "{{{,}}}"

-- UI

o.nu = true
o.relativenumber = true
o.numberwidth = 2

o.cursorline = true
o.guicursor = ""

o.colorcolumn = 80
o.wrap = false
o.scrolloff = 5

o.termguicolors = true
o.background = "dark"

-- NETRW improvements
g.netrw_banner = 0
g.netrw_altv = 1
g.netrw_bufsettings = "noma nomod nu nobl nowrap ro"
