require('mondeendeguise.plugins')
require('mondeendeguise.settings')
require('mondeendeguise.keybinds')

-- lsp setup
require'lspconfig'.pyright.setup {}
require'lspconfig'.sumneko_lua.setup {
  settings = {
    -- settings go here
  }
}
