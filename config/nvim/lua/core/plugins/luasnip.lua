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
            local s = ls.snippet
            local n = ls.snippet_node
            local t = ls.text_node
            local i = ls.insert_node
            local f = ls.function_node
            local c = ls.choice_node
            local d = ls.dynamic_node

            local fmt = require("luasnip.extras.fmt").fmt

            ls.config.set_config({
                store_selection_keys = "<c-s>",
            })

            local pretty_date = function()
                return { os.date("%d %B %Y") }
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

            local function split_string(str)
                local words = {}
                for word in str:gmatch("%w+") do table.insert(words, word) end
                return words[#words]
            end

            ls.add_snippets(nil, {
                all = {
                    s({
                        trig = "date",
                        namr = "Pretty date",
                        dscr = "Date in the form of DD Month YYYY",
                    }, {
                        f(pretty_date, {}),
                    }),

                    s({
                        trig = "filename",
                        namr = "Filename",
                        dscr = "Absolute path to file",
                    }, {
                        f(filename, {}),
                    }),

                    s({
                        trig = "pwd",
                        namr = "PWD",
                        dscr = "Path to current working directory",
                    }, {
                        f(bash, {}, { user_args = { "pwd" } }),
                    }),
                },

            })
        end
    },
}
