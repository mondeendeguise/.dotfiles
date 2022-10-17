return require('packer').startup(function(use)
  -- packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Langs {{{
  use 'tjdevries/nlua.nvim'
  use 'rust-lang/rust.vim'
  -- }}}

  -- LSP {{{
  use {
    'neovim/nvim-lspconfig',
    requires = {
      { -- Pretty self explanatory, adds :LspInstall to easily install LSP for current file
        'williamboman/nvim-lsp-installer',
      },
      { -- Shows definition for function while typing
        'ray-x/lsp_signature.nvim',
      },
      { -- Menu for sorting through LSP warnings and errors
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
          require('trouble').setup {
            -- leave empty for defaults
          }
        end
      },
    },
  }
  -- }}}

  -- TreeSitter {{{
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      { -- Pretty tagbar idk
        'preservim/tagbar'
      },
    },
  }
  -- }}}

  -- Completion {{{
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      { -- Snippet engine
        'L3MON4D3/LuaSnip',
        tag = 'v<CurrentMajor>.*'
      },
      { -- Add completions from LSP
        'hrsh7th/cmp-nvim-lsp'
      },
      { -- Add completions from current buffer
        'hrsh7th/cmp-buffer'
      },
      { -- Add completions from current path
        'hrsh7th/cmp-path'
      },
      { -- Add completions from BASH
        'hrsh7th/cmp-cmdline'
      },
      { -- Add completions from snippet engine
        'saadparwaiz1/cmp_luasnip'
      },
    }
  }

  -- }}}

-- autopairs {{{
  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup {} end
  }
  -- }}}

  -- Useful tools {{{
  -- file explorer {{{
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    tag = 'nightly'
  }
  -- }}}

  -- lua repl
  use 'bfredl/nvim-luadev'

  -- }}}

  -- Fixes{{{
  -- bless the lord tpope
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-repeat'

  -- gf functionality
  use 'sam4llis/nvim-lua-gf'
  -- }}}

  -- Visual aid {{{
  -- groovy status line
  use 'feline-nvim/feline.nvim'

  -- indent guides
  use 'lukas-reineke/indent-blankline.nvim'

  -- colorscheme
  use 'gruvbox-community/gruvbox'
  use 'navarasu/onedark.nvim'
  use 'tiagovla/tokyodark.nvim'

  -- greeter
  use {
    'goolord/alpha-nvim',
    config = function()
      require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
    end
  }

  -- git
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }
  -- }}}
end)
