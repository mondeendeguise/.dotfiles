-- Vim Opts
local o = vim.o
-- Vim Globals
local g = vim.g

o.smarttab = true
o.expandtab = true
o.autoindent = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4

o.hlsearch = false
o.incsearch = true

o.laststatus = 2

-- Completion items aren't inserted until explicitly selected
o.completeopt = "menuone,noinsert"
-- Completion menu
o.pumheight = 7

o.fillchars = "fold: "
o.foldlevelstart = 99
o.foldmethod = "marker"
o.foldmarker = "{{{,}}}"

-- UI
o.nu = true
o.relativenumber = true
o.numberwidth = 2
o.cursorline = true
o.scrolloff = 8
o.guicursor = ""
o.wrap = false

o.termguicolors = true
o.background = "dark"

-- netrw improvements
g.netrw_banner = 0
g.netrw_altv = 1
-- g.netrw_liststyle = 3
