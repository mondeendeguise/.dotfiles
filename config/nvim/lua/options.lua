-- Vim Options & Globals
local o = vim.opt
local g = vim.g

o.smarttab = true
o.expandtab = true
o.autoindent = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4

-- Search options
o.ignorecase = true
o.smartcase = true
o.hlsearch = false
o.incsearch = true

o.laststatus = 2

-- Completion items aren't inserted until explicitly selected
o.completeopt = "menuone,noinsert"
-- Completion menu
o.pumheight = 7

-- Folds
-- o.fillchars = "fold: "
o.foldlevelstart = 99
-- o.foldmethod = "marker"
o.foldmethod = "expr"
-- o.foldmarker = "{{{,}}}"
o.foldexpr = "nvim_treesitter#foldexpr()"

-- UI
o.nu = true
o.relativenumber = true
o.numberwidth = 2
o.cursorline = true
o.scrolloff = 8
o.guicursor = ""
o.wrap = false

-- Appearance
o.termguicolors = true
o.background = "dark"
o.signcolumn = "yes"

-- NETRW Fix
g.netrw_banner = 0
g.netrw_altv = 1
-- g.netrw_liststyle = 3

-- Splits
o.splitright = true
o.splitbelow = true

-- Hyphen is part of words now
o.iskeyword:append("-")

