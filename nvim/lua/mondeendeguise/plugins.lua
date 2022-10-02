return require('packer').startup(function(use)
	-- packer can manage itself
	use 'wbthomason/packer.nvim'

    -- lsp
    use 'neovim/nvim-lsp'

	-- bless the lord tpope
	use 'tpope/vim-surround'
	use 'tpope/vim-commentary'
	use 'tpope/vim-repeat'

	-- groovy status line
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	-- colorscheme
	use 'gruvbox-community/gruvbox'
end)
