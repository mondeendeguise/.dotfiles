require("neo-tree").setup({
  close_if_last_window = true,
  source_selector = {
    winbar = false,
    statusline = false,
  },
  filesystem = {
    filtered_items = {
      visible = false,
      hide_dotfiles = false,
      hide_gitignored = true,
      hide_by_name = {
        ".git",
        "Cargo.lock",
        "__pycache__",
      },
      hide_by_pattern = {
        "*.swp",
      },
      always_show = {
        ".env",
        -- "target",
      },
    },
  },
})
