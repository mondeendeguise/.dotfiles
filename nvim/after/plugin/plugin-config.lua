local o = vim.opt
local api = vim.api
local M = {}

require('feline').setup()
require('indent_blankline').setup {
  -- show_current_context = true,
  -- show_current_context_start = true,
}

-- augroups {{{
function M.nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    api.nvim_command('augroup '..group_name)
    api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      api.nvim_command(command)
    end
    api.nvim_command('augroup END')
  end
end

local auto_commands = {
  open_folds = {
    {"BufReadPost,FileReadPost", "*", "normal zR"}
  }
}

M.nvim_create_augroups(auto_commands)
-- }}}

-- Colorscheme {{{
-- vim.cmd('colorscheme gruvbox')
require('onedark').setup {
  style = 'darker'
}
require('onedark').load()
-- vim.cmd('colorscheme tokyodark')
-- }}}

-- Treesitter {{{
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = "all",

  -- Install parsers synchronously (only applied to 'ensure_installed')
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = {},

  highlight = {
    -- 'false' will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = {},

    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  }
}
-- }}}

-- Folds {{{
-- o.foldmethod = "expr"
-- o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldmethod = 'marker'
o.foldmarker = '{{{,}}}'
-- }}}

-- LSP {{{
require('nvim-lsp-installer').on_server_ready(function(server)
  local opts = {}
  if server.name == 'sumneko_lua' then
    opts = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim', 'use' }
          },
        }
      }
    }
  end
  server:setup(opts)
end)
-- }}}

-- Tree {{{
require('nvim-tree').setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = 'u', action = 'dir_up' },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
-- }}}
