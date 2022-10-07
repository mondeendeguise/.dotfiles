return require('packer').startup(function(use)
  -- packer can manage itself
  use 'wbthomason/packer.nvim'

  -- langs
  use 'tjdevries/nlua.nvim'
  use 'rust-lang/rust.vim'

  -- lua repl
  use 'bfredl/nvim-luadev'

  -- lsp
  use 'nvim-treesitter/nvim-treesitter'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  -- cmp
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'

  -- snippet engine
  use {
    'L3MON4D3/LuaSnip',
    tag = 'v<CurrentMajor>.*'
  }

  -- autopairs
  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup {} end
  }

  -- git
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- greeter
  use {
    'goolord/alpha-nvim',
    config = function()
      require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  }

  -- bless the lord tpope
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-repeat'

  -- file explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    tag = 'nightly'
  }

  -- gf functionality
  use 'sam4llis/nvim-lua-gf'

  -- tagbar
  use 'preservim/tagbar'

  -- groovy status line
  use 'feline-nvim/feline.nvim'

  -- indent guides
  use 'lukas-reineke/indent-blankline.nvim'

  -- colorscheme
  use 'gruvbox-community/gruvbox'
  use 'navarasu/onedark.nvim'
  use 'tiagovla/tokyodark.nvim'
end)
