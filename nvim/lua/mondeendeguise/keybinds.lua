local map = vim.api.nvim_set_keymap
local opts = { noremap = true }
local function nmap(key, kmap)
  map('n', key, kmap, opts)
end

-- Newlines
map('n', '<c-j>', 'o<esc>', opts)
map('n', '<c-k>', 'O<esc>', opts)

-- Change indent continuously
map('v', '<', '<gv', {})
map('v', '>', '>gv', {})

-- LSP keybinds
nmap('gd', ':lua vim.lsp.buf.definition()<cr>')
nmap('gD', ':lua vim.lsp.buf.declaration()<cr>')
nmap('gi', ':lua vim.lsp.buf.implementation()<cr>')
nmap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
nmap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
nmap('gr', ':lua vim.lsp.buf.references()<cr>')
nmap('gt', ':lua vim.lsp.buf.type_definition()<cr>')
nmap('K', ':lua vim.lsp.buf.hover()<cr>')
-- nmap('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
nmap('<leader>af', ':lua vim.lsp.buf.code_action()<cr>')
nmap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>')
