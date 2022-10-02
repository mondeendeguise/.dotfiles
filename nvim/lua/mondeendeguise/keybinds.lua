local keymap = vim.api.nvim_set_keymap

local opts = { noremaps = true }

-- Newlines
keymap('n', '<c-j>', 'o<esc>', {})
keymap('n', '<c-k>', 'O<esc>', {})

-- Change indent continuously
keymap('v', '<', '<gv', {})
keymap('v', '>', '>gv', {})
