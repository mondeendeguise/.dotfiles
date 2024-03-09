return {
    {
        "nvim-telescope/Telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        lazy = false,

        keys = {
            { "<leader>pf", "<cmd>Telescope git_files<cr>", desc = [[
                Fuzzy search through the output of `git ls-files` command,
                respects .gitignore ]] },
            { "<leader>pg", "<cmd>Telescope live_grep<cr>", desc = [[
                Search for a string in your current working directory and get
                results live as you type, respects .gitignore.
                (Requires ripgrep) ]] },
            { "<leader>pi", "<cmd>Telescope grep_string<cr>", desc = [[
                Searches for the string under your cursor or selection in your
                current working directory ]] },
        },
        
        extensions = {
            media_files = {
                filetypes = { "png", "webp", "jpg", "jpeg", "webm", "mp4", "pdf" },
                find_cmd = "rg",
            },
        },
    },

    {
        "nvim-telescope/telescope-media-files.nvim",
        init = function()
            require("telescope").load_extension("media_files")
        end
    },
}
