return {
    { "tpope/vim-repeat" },

    { "tpope/vim-surround" },

    { "tpope/vim-speeddating" },

    { "tpope/vim-commentary" },

    {
        "tpope/vim-fugitive",
        cmd = "Git",
    },

    { -- NeoVim as a Hex editor
        "RaafatTurki/hex.nvim",
        config = {
            dump_cmd = "xxd -g 1 -u",
            assemble_cmd = "xxd -r",
        },
    },
}
