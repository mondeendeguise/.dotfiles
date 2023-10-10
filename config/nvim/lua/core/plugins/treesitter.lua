return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufEnter",
    cmd = { "TSUpdateSync" },

    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = {
                "lua", "python", "vim",
                "bash", "c",
                "html", "javascript", "json",
                "markdown", "regex", "yaml",
            },
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
