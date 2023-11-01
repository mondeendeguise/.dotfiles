return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            style = "storm",
            transparent = true,
            styles = {
                comments = { italic = true },
                keywords = { italic = true },
                functions = {},
                variables = {},

                sidebars = "dark",
                floats = "dark",
            },
            sidebars = { "help" },
            dim_inactive = false,
            lualine_bold = false,

        },
        init = function()
            vim.cmd([[colorscheme tokyonight]])
        end
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {}
    },

    { "christoomey/vim-tmux-navigator" },

    {
        "stevearc/dressing.nvim",
        lazy = false,
        opts = {},
    },

    {
        "rcarriga/nvim-notify",
        keys = {
            {
                "<Leader>un",
                function()
                    require("notify").dismiss({ silent = true, pending = true })
                end,
                desc = "Dismiss all notifications",
            },
        },
        opts = {
            timeout = 3000,
            max_height = function()
                return math.floor(vim.o.lines * 0.75)
            end,
            max_width = function()
                return math.floor(vim.o.columns * 0.75)
            end,
        },
        init = function()
            vim.notify = require("notify")
        end,
    },

    { "stevearc/dressing.nvim", event = "VeryLazy" },
}
