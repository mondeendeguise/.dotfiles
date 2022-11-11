local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

local function get_config(name)
  return string.format('require("config/%s")', name)
end

-- {{{ Install packer if not present
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path
  })
  print("Installing Packer.nvim...")
  vim.api.nvim_command("packadd packer.nvim")
end
-- }}} Install packer if not present

local packer = require("packer")

packer.init({
  enable = true,
  threshold = 0,
  max_jobs = 20,

  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

packer.startup(function(use)
  -- packer can manage itself
  use({ "wbthomason/packer.nvim" })

  -- {{{ Coding
  use({ "windwp/nvim-autopairs", config = get_config("coding.nvim-autopairs") })

  use({
    "nvim-treesitter/nvim-treesitter",
    config = get_config("coding.treesitter"),
    run = ":TSUpdate",
  })

  use({
    "windwp/nvim-ts-autotag",
    "RRethy/nvim-treesitter-endwise",
    "p00f/nvim-ts-rainbow",

    after = "nvim-treesitter",
  })

  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-calc",
      "lukas-reineke/cmp-rg",
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    config = get_config("coding.cmp"),
  })

  use({ "rafamadriz/friendly-snippets" })

  use({
    "L3MON4D3/LuaSnip",
    requires = "saadparwaiz1/cmp_luasnip",
    config = get_config("coding.luasnip"),
  })


  use({
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = get_config("coding.indent-blankline"),
  })

  use({
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = get_config("coding.todo"),
  })

  use({ "rhysd/vim-grammarous", ft = { "markdown" }, config = get_config("coding.grammarous") })

  use({ "LudoPinelli/comment-box.nvim", cmd = "CB*", config = get_config("coding.comment-box") })


  use({
    "aarondiel/spread.nvim",
    after = "nvim-treesitter",
    config = get_config("coding.spread"),
  })

  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = get_config("coding.trouble")
  })

  use({ "axieax/urlview.nvim", cmd = "Urlview", config = get_config("ui.urlview") })

  use({ "tpope/vim-surround" })
  use({ "tpope/vim-commentary" })
  use({ "tpope/vim-repeat" })

  use({ "sam4llis/nvim-lua-gf" })
  -- }}} Coding

  -- {{{ LSP
  use({ "neovim/nvim-lspconfig", config = get_config("lsp.lsp") })

  use({
    "williamboman/mason.nvim",
    cmd = "Mason*",
    module = "mason-tool-installer",
    requires = { "williamboman/mason-lspconfig.nvim", "WhoIsSethDaniel/mason-tool-installer.nvim" },
    config = get_config("lsp.mason"),
  })

  use({ "onsails/lspkind.nvim" })

  use({ "SmiteshP/nvim-navic", requires = { "neovim/nvim-lspconfig" } })
  -- }}} LSP

  -- {{{ UI
  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = get_config("ui.neotree")
  })

  use({
    "simrat39/symbols-outline.nvim",
    cmd = { "SymbolsOutline" },
    config = get_config("ui.symbols"),
  })

  use({
    "akinsho/nvim-toggleterm.lua",
    config = get_config("ui.toggleterm"),
  })

  use({ "ahmedkhalf/project.nvim", config = get_config("ui.project") })

  use({ "folke/which-key.nvim", config = get_config("ui.which-key") })

  use({
    "noib3/nvim-cokeline",
    required = "kyazdani42/nvim-web-devicons",
    config = get_config("ui.cokeline"),
  })

  use({ "preservim/tagbar" })

  use({ "feline-nvim/feline.nvim", config = get_config("ui.feline") })

  use({ "tiagovla/tokyodark.nvim", config = get_config("ui.tokyodark") })
  -- }}} UI

  -- {{{ Git
  use({
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = get_config("git.gitsigns"),
  })

  use({ "tpope/vim-fugitive" })
  -- }}} Git
end)
