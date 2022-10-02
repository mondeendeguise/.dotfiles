local g = vim.g

require('lualine').setup()

vim.cmd('colorscheme gruvbox')

-- Treesitter
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust" },

  -- Install parsers synchronously (only applied to 'ensure_installed')
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = {},

  highlight = {
    -- 'false' will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = {},

    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
  }
}
-- Folds
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- LSP
require('nvim-lsp-installer').on_server_ready(function(server)
  local opts = {}
  if server.name == 'sumneko_lua' then
    opts = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim', 'use' }
          },
        }
      }
    }
  end
  server:setup(opts)
end)
