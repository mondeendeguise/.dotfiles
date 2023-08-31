require("nvim-autopairs").setup({
    fast_wrap = {
        map = "<C-e>",
        chars = { "{", "[", "(", '"', "'" },
        pattern = [=[[%'%"%>%]%)%}%,]]=],
        end_key = "$",
        keys = "qwertyuuiopzxcvbnmasdfghjkl",
        check_comma = true,
        manual_position = true,
        highlight = "Search",
        highlight_grea = "Comment",
    },

    enable_check_bracket_line = false,
    ignored_next_char = "[%w%.]",
})
