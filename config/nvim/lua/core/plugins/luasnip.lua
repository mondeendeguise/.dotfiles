return {
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = {
            { "rafamadriz/friendly-snippets" },
        },
        init = function()
            require("luasnip/loaders/from_vscode").lazy_load()
            local ls = require("luasnip")
            -- some shorthands...
            local snip = ls.snippet
            local node = ls.snippet_node
            local text = ls.text_node
            local insert = ls.insert_node
            local func = ls.function_node
            local choice = ls.choice_node
            local dynamicn = ls.dynamic_node

            ls.config.set_config({
                store_selection_keys = "<c-s>",
            })

            local date = function()
                return { os.date("%Y-%m-%d") }
            end

            local filename = function()
                return { vim.fn.expand "%:p" }
            end

            local function bash(_, _, command)
                local file = io.popen(command, "r")
                local res = {}
                for line in file:lines() do
                    table.insert(res, line)
                end
                return res
            end

            ls.add_snippets(nil, {
                all = {
                    snip({
                        trig = "date",
                        namr = "Date",
                        dscr = "Date in the form of YYYY-MM-DD",
                    }, {
                        func(date, {}),
                    }),

                    snip({
                        trig = "filename",
                        namr = "Filename",
                        dscr = "Absolute path to file",
                    }, {
                        func(filename, {}),
                    }),

                    snip({
                        trig = "pwd",
                        namr = "PWD",
                        dscr = "Path to current working directory",
                    }, {
                        func(bash, {}, { user_args = { "pwd" } }),
                    }),
                },
            })
        end,
    },
}
