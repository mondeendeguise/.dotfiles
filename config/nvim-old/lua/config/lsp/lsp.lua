local nvim_lsp = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

nvim_lsp["sumneko_lua"].setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

nvim_lsp["rust_analyzer"].setup({
  capabilities = capabilities
})

nvim_lsp["clangd"].setup({
  capabilities = capabilities
})

nvim_lsp["emmet_ls"].setup({
  capabilities = capabilities
})

nvim_lsp["texlab"].setup({
  capabilities = capabilities
})
