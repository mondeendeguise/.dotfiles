vim.o.autoindent = true
vim.o.smarttab = true
vim.o.tabstop = 4
vim.o.softtabstop = 2
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.laststatus = 2

vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 4

vim.o.cursorcolumn = true
vim.o.cursorline = true
vim.o.guicursor = ''

vim.o.wrap = false
vim.o.scrolloff = 8

vim.o.termguicolors = true
vim.o.background = 'dark'

vim.g.mapleader = ' '

vim.g.netrw_banner = 0
vim.g.netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

vim.keymap.set('n', '<leader>pv', vim.cmd.Explore, {})

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    { 'tpope/vim-fugitive', cmd = 'Git', },
    'tpope/vim-endwise',
    'tpope/vim-abolish',
    'tpope/vim-speeddating',
    'tpope/vim-surround',
    'tpope/vim-repeat',

    'christoomey/vim-tmux-navigator',

    { 'catppuccin/nvim', name = 'catppuccin', priority = 1000, opts = { transparent_background = true, }, init = function() vim.cmd([[colorscheme catppuccin]]) end, },
})
