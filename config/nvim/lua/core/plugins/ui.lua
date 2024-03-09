return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            style = "storm",
            transparent = true,
            styles = {
                comments =  {},
                keywords =  {},
                functions = { italic = true },
                variables = { italic = true },
            },

            sidebars = { "help" },
            dim_inactive = false,
        },
        init = function()
            vim.cmd([[colorscheme tokyonight]])
        end
    },

    { "christoomey/vim-tmux-navigator" },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },

    {
        "anuvyklack/pretty-fold.nvim",
        config = {
            sections = {
                left = {
                    "content", "",
                },

                right = {
                    " ", "number_of_folded_lines", "percentage", " ",
                },
            },

            fill_char = " ",

            remove_fold_markers = true,
            keep_indentation = true,

            process_comment_signs = "spaces",

            comment_signs = {},

            stop_words = {
                "@brief%s*",
            },

            add_close_pattern = true,

            matchup_patterns = {
                {  "{", "}" },
                { "%(", ")" },
                { "%[", "]" },
            },
        },
    },
}
