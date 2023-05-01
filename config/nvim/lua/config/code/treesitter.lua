require("nvim-treesitter.configs").setup({
  -- A list of parser names, or "all"
  ensure_installed = { "bash", "c", "dockerfile", "html", "javascript", "json", "latex", "lua", "markdown", "python", "rust", "sql", "toml", "yaml" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  autotag = {
    enable = true,
  },

  endwise = {
    enable = true,
  },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
