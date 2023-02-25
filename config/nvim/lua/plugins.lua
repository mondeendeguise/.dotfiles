local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

local function get_config(name)
  return string.format('require("config/%s")', name)
end

-- {{{ Bootstrap packer
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer.nvim")
  vim.api.nvim_command("packadd packer.nvim")
end
-- }}} Bootstrap packer

-- {{{ Packer config
require("packer").init({
  enable = true,
  threshold = 0,
  max_jobs = 20,

  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})
-- }}} Packer config

return require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim" })

    -- {{{ Code
	use({
		"nvim-treesitter/nvim-treesitter",
		{ run = ":TSUpdate" },
        config = get_config("code.treesitter"),
	})

	use({ "nvim-treesitter/playground" })

    use({
      "windwp/nvim-autopairs",
      config = get_config("code.autopairs"),
    })

    use({ "windwp/nvim-ts-autotag" })
    use({ "RRethy/nvim-treesitter-endwise" })

    -- }}} Code

    -- {{{ Git
    use({
      "tpope/vim-fugitive",
      config = get_config("git.fugitive"),
    })
    -- }}} Git

    -- {{{ LSP
    use({
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            -- Snippet Collection (Optional)
            { "rafamadriz/friendly-snippets" },
        },
        config = get_config("lsp.lsp-zero"),
    })
    -- }}} LSP

	-- {{{ UI
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { "nvim-lua/plenary.nvim" },
        config = get_config("ui.telescope"),
	})

	use({
      "theprimeagen/harpoon",
      config = get_config("ui.harpoon"),
    })

	use({
      "mbbill/undotree",
      config = get_config("ui.undotree"),
    })

    use({
      "folke/tokyonight.nvim",
      config = get_config("ui.color"),
    })

	use({
		"rose-pine/neovim",
		as = "rose-pine",
		config = get_config("ui.color"),
	})
    
    use({ "tpope/vim-commentary" })
    -- }}} UI
end)
