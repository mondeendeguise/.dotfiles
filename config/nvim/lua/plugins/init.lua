-- Bootstrap lazy.nvim
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

-- {{{ Plugins
local plugins = {
    -- {{{ UI
    -- Colorschemes
    { "folke/tokyonight.nvim" },
    { "rose-pine/neovim", name = "rose-pine" },
    {
        "bluz71/vim-nightfly-colors",
        name = "nightfly",
        lazy = false,
        priority = 1000,
        config = function()
            require("plugins.colorscheme")
        end,
    },

    { "mbbill/undotree" },
    { "edluffy/hologram.nvim", opts = { auto_display = true } },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "BurntSushi/ripgrep",
        },
    },

    { "christoomey/vim-tmux-navigator" },
    -- }}} UI

    -- {{{ Code
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "RRethy/nvim-treesitter-endwise",
            "windwp/nvim-ts-autotag",
        },
        build = ":TSUpdate",
        config = function()
            require("plugins.treesitter")
        end,
        lazy = false,
    },

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("plugins.autopairs")
        end,
    },

    -- Gord bless u tpope <33
    { "tpope/vim-commentary" },
    { "tpope/vim-surround" },
    { "tpope/vim-fugitive" },

    {
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        version = "2.*",
        build = "make install_jsregexp",
        config = function()
            require("plugins.snippets")
        end,
    },

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },
    -- }}} Code

    -- Diagnostics {{{
    {
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
        init = function()
            vim.g.startuptime_tries = 10
        end,
    },
    -- Diagnostics }}}

    -- {{{ LSP
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate",
        lazy = false,
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "folke/neodev.nvim",
        },
        config = function()
            require("plugins.lsp")
        end,
    },

    { "ray-x/lsp_signature.nvim", lazy = false },
    -- }}} LSP

    -- {{{ CMP
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/cmp-luasnip-choice",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-emoji",
            "L3MON4D3/LuaSnip",
            "onsails/lspkind.nvim",
            { "glepnir/lspsaga.nvim", branch = "main" },
        },
        config = function()
            require("plugins.cmp")
        end,
    },
    -- }}} CMP
}

local opts = {}

require("lazy").setup(plugins, opts)
