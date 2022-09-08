return require('packer').startup(function(use)
	-- packer can manage itself
	use 'wbthomason/packer.nvim'

	-- bless the lord tpope
	use 'tpope/vim-surround'
	use 'tpope/vim-commentary'
	use 'tpope/vim-repeat'

	-- groovy status line
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

    -- -- funky file finder
    -- use 'francoisabrol/ranger.vim'

	-- colorscheme
	use 'gruvbox-community/gruvbox'
end)
