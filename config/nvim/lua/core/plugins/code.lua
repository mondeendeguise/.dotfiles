return {
    { "tpope/vim-repeat" },
    { "tpope/vim-surround" },
    { "tpope/vim-speeddating" },
    { "tpope/vim-commentary" },
    { "tpope/vim-fugitive", cmd = "Git", },
    
    { "cohama/lexima.vim" },  -- autopairs

    {
        "RaafatTurki/hex.nvim",
        config = {
            dump_cmd = "xxd -g 1 -u",
            assemple_cmd = "xxd -r",
        },
    },

    {
        "godlygeek/tabular",
        cmd = "Tabularize",
        keys = {
            { "<Leader>a=", "<cmd>Tabularize /=<cr>", mode = {"n", "v"}, desc = "Align by = sign" },
            { "<Leader>a:", "<cmd>Tabularize /:<cr>", mode = {"n", "v"}, desc = "Align by : sign" },
        },
    }
}
