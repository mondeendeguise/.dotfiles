local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp_buffer = require("cmp_buffer")
local lspkind = require("lspkind")
local ls = require("luasnip")
local types = require("cmp.types")
local str = require("cmp.utils.str")

-- Setup {{{
cmp.setup({
    snippet = {
        expand = function(args)
            ls.lsp_expand(args.body)
        end,
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol",
            maxwidth = 50,
            ellipsis_char = "...",

            before = function (entry, vim_item)
                -- ...
                return vim_item
            end,
        })
    },

    mapping = {
        ["<CR>"] = cmp.mapping({
            i = function(fallback)
                if cmp.visible() and cmp.get_active_entry() then
                    cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                else
                    fallback()
                end
            end,
            s = cmp.mapping.confirm({ select = true }),
            c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
        }),

        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif ls.expand_or_jumpable() then
                ls.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif ls.jumpable(-1) then
                ls.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    },

    sources = {
        -- {
        --     name = "buffer",
        --     option = {
        --         keyword_pattern = [[\k\+]],

        --         get_bufnrs = function()
        --             local buf = vim.api.nvim_get_current_buf()
        --             local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
        --             if byte_size > 1024 * 1024 then -- 1 MiB RAM Limit
        --                 return {}
        --             end

        --             local bufs = {}
        --             for _, win in ipairs(vim.api.nvim_list_wins()) do
        --                 bufs[vim.api.nvim_win_get_buf(win)] = true
        --             end
        --             return vim.tbl_keys(bufs)
        --         end,
        --     },
        -- },
        { name = "nvim_cmp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    },

    sorting = {
        comparators = {
            function(...) return cmp_buffer:compare_locality(...) end,
        },
    },
})
-- Setup }}}

cmp.event:on(
    "confirm_dont",
    cmp_autopairs.on_confirm_done()
)

cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" }
    },
})

cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" }
    }, {
        {
            name = "cmdline",
            option = {
                ignore_cmds = { "Man", "!" }
            }
        }
    })
})

