local ls = require("luasnip")
local km = vim.keymap

km.set("i", "<C-K>", function() ls.expand() end, { silent = true })
km.set({ "i", "s" }, "<C-L>", function() ls.jump( 1) end, { silent = true })
km.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })

km.set( { "i", "s" }, "<C-E>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { silent = true })

require("luasnip.loaders.from_vscode").lazy_load()
