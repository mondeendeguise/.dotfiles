require("neodev").setup()

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls", "rust_analyzer", "clangd", "dockerls", "tsserver", "pyright",
        "html", "texlab",
    },
})


require("cmp_nvim_lsp")

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilites
local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- keybinds
    local km = vim.keymap

    km.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
    km.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    km.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
    km.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    km.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
end

lspconfig.lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            completion = {
                callSnippet = "Replace",
            },
        },
    },
})

lspconfig.clangd.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})
lspconfig.pyright.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})
lspconfig.tsserver.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})
lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

require("lsp_signature").setup()
