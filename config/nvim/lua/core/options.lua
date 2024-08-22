local function add_options(option_table)
    for key, value in pairs(option_table) do
        vim.o[key] = value
    end
end

local g = vim.g

g.mapleader = " "

-- NETRW improvements
g.netrw_banner = 0
g.netrw_bufsettings = "noma nomod nu nobl nowrap ro" -- numbers in netrw

add_options({
    smarttab = true,
    autoindent = true,
    tabstop = 4,
    softtabstop = 2,
    shiftwidth = 4,
    expandtab = true,

    smartcase = true,
    hlsearch = false,
    incsearch = true,

    laststatus = 2,

    -- Completion won't insert until explicit selection
    completeopt = "menuone,noinsert",
    pumheight = 7,

    -- Enable folds, but start with everything* unfolded
    foldlevelstart = 99,
    foldmethod = "marker",
    foldmarker = "{{{,}}}",
    -- foldmethod = "expr",
    -- foldexpr = "nvim_treesitter#foldexpr()",

    nu = true,
    relativenumber = true,
    numberwidth = 4,

    cursorcolumn = true,
    cursorline = true,
    guicursor = "",

    wrap = false,
    scrolloff = 5,

    -- Theme compatibility
    termguicolors = true,
    background = "dark",
})
