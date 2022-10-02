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

o.nu = true
o.relativenumber = true
o.numberwidth = 2
o.cursorline = true
o.scrolloff = 8
o.guicursor = ''
o.wrap = false

o.spell = true

o.termguicolors = true
o.background = 'dark'

g.mapleader = ','

-- necessary netrw improvements

g.netrw_banner = 0        -- disable annoying banner
-- g.netrw_browse_split = 4  -- open in prior window
-- g.netrw_altv = 1          -- open splits to the right
g.netrw_liststyle = 3     -- tree style
g.netrw_list_hide = 'netrw_gitignore#Hide()'
