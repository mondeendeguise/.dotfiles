local km = vim.keymap

vim.g.mapleader = " "

-- Open netrw
km.set("n", "<leader>pv", vim.cmd.Ex)

-- Append characters to line
km.set("i", ";;", "<cmd>s/$/;<cr><c-o>``")
km.set("i", ",,", "<cmd>s/$/,<cr><c-o>``")
