local keymap = vim.keymap

-- Change indent continuously
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- LSP keybinds {{{
keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<cr>")
keymap.set("n", "gD", ":lua vim.lsp.buf.declaration()<cr>")
keymap.set("n", "gi", ":lua vim.lsp.buf.implementation()<cr>")
keymap.set("n", "gw", ":lua vim.lsp.buf.document_symbol()<cr>")
keymap.set("n", "gw", ":lua vim.lsp.buf.workspace_symbol()<cr>")
keymap.set("n", "gr", ":lua vim.lsp.buf.references()<cr>")
keymap.set("n", "gt", ":lua vim.lsp.buf.type_definition()<cr>")
keymap.set("n", "K", ":lua vim.lsp.buf.hover()<cr>")
keymap.set("n", "<c-k>", ":lua vim.lsp.buf.signature_help()<cr>")
keymap.set("n", "<leader>af", ":lua vim.lsp.buf.code_action()<cr>")
keymap.set("n", "<leader>rn", ":lua vim.lsp.buf.rename()<cr>")

keymap.set("n", "<leader>ff", ":lua vim.lsp.buf.format()<cr>")
-- }}}

-- Cokeline {{{
keymap.set("n", "<tab>", "<plug>(cokeline-focus-next)", { silent = true })
keymap.set("n", "<s-tab>", "<plug>(cokeline-focus-prev)", { silent = true })
keymap.set("n", "<leader>tn", "<plug>(cokeline-switch-next)", { silent = true })
keymap.set("n", "<leader>tp", "<plug>(cokeline-switch-prev)", { silent = true })

for i = 1,9 do
  keymap.set("n", ("<f%s>"):format(i), ("<plug>(cokeline-focus-%s)"):format(i), { silent = true })
  keymap.set("n", ("<leader%s>"):format(i), ("<plug>(cokeline-switch-%s)"):format(i), { silent = true })
end
-- }}}

keymap.set("n", "<leader>p", "<cmd>lua require('nabla').popup()<cr>", { silent = true })

-- Insert trailing ; or , from normal mode
keymap.set("n", "<leader>;", "<esc>A;<esc>")
keymap.set("n", "<leader>,", "<esc>A,<esc>")

-- TagBar
keymap.set("n", "<leader>tb", "<cmd>TagbarToggle<cr>", { silent = true })

-- Trouble
keymap.set("n", "<leader>tt", "<cmd>TroubleToggle<cr>", { silent = true })
keymap.set("n", "<leader>tf", "<cmd>TroubleToggle quickfix<cr>", { silent = true })

-- Go to path of file under cursor
-- Similar to gf but instead opens neo-tree
-- keymap.set("n", "gd", "<cmd>Neotree float reveal_file=<cfile> reveal_force_cwd<cr", { noremap = true })
