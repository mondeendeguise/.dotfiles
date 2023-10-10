local k = vim.keymap

local opts = {
    noremap = true,
    silent = true,
}

k.set("n", "<Leader>pv", vim.cmd.Ex, opts)
