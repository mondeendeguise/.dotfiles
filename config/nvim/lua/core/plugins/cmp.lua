return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
    },

    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            { "saadparwaiz1/cmp_luasnip" },
        },

        config = function()
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                sources = cmp.config.sources({
                    { name = "luasnip" },
                }),

                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },

                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },

                mapping = cmp.mapping.preset.insert({
                    ["<CR>"] = cmp.mapping.confirm({ select = false }),
                }),
            })

            cmp.event:on(
                "confirm_done",
                cmp_autopairs.on_confirm_done()
            )
        end,
    },
}
