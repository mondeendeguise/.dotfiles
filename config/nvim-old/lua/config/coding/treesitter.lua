require("nvim-treesitter.configs").setup({
  ensure_installed = { "bash", "bibtex", "cpp", "css", "dockerfile", "go", "html", "java", "javascript", "json", "latex", "lua", "markdown", "python", "rust", "sql", "toml", "yaml" },
  sync_install = false,
  ignore_install = {},

  autotag = {
    enable = true,
    filetypes = {
      "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte", "vue", "tsx", "jsx", "rescript",
      "xml",
      "php",
      "markdown",
      "glimmer", "handlebars", "hbs",
    },
    skip_tags = {
      "area", "base", "br", "col", "command", "embed", "hr", "img", "slot",
      "input", "keygen", "link", "meta", "param", "source", "track", "wbr", "menuitem",
    },
  },

  endwise = {
    enable = true,
  },

  rainbow = {
    enable = true,
    extended_mode = true,
  },

  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = true,
  },

  indent = { enable = true, disable = {} },
})
