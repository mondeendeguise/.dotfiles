vim.g.mapleader = " "
local km = vim.keymap

km.set("i", "jk", "<ESC>")

-- Remove highlights
km.set("n", "<leader>nh", ":nohl<CR>")

-- Copy/Paste registers {{{

    -- Yank to system clipboard
km.set("v", "<C-c>", '"+ygv', { noremap = true, silent = true })

    -- Paste from system clipboard
km.set("n", "<C-v>", '"+p', { noremap = true, silent = true })
km.set("v", "<C-v>", '"+p', { noremap = true, silent = true })

    -- Send directly to /dev/null
km.set("n", "X", '"_x', { noremap = true, silent = true })

-- Copy/Paste registers }}}

-- Splits {{{
km.set("n", "<leader>sv", "<C-w>v", { silent = true })
km.set("n", "<leader>sh", "<C-w>s", { silent = true })
km.set("n", "<leader>sq", "<C-w>c", { silent = true })
-- Splits }}}

-- Project View
km.set("n", "<leader>pv", vim.cmd.Ex)

-- Append line terminators from insert mode
km.set("i", ";;", "<cmd>s/$/;<cr><c-o>``")
km.set("i", ",,", "<cmd>s/$/,<cr><c-o>``")
