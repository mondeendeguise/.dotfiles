require('mondeendeguise.plugins')
require('mondeendeguise.settings')
require('mondeendeguise.keybinds')

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

-- treesitter folds
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- lsp setup
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

-- require'lspconfig'.sumneko_lua.setup {
--   settings = {
--     Lua = {
--       diagnostics = {
--         globals = { 'vim' }
--       }
--     }
--   }
-- }
-- require'lspconfig'.pyright.setup {}
-- require'lspconfig'.rust_analyzer.setup {}
