local capabilities = require('cmp_nvim_lsp').default_capabilities()

local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

require("mason").setup()

-- mason_lspconfig.setup({
--     ensure_installed = { "lua_ls", "clangd", "rust_analyzer" },
--     automatic_installation = false,
-- })

mason_lspconfig.setup_handlers({
    function (server)
        local opts = {
            capabilities = capabilities
        }
        lspconfig[server].setup(opts)
    end,
})
