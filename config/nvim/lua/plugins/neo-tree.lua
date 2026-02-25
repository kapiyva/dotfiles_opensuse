require("neo-tree").setup({
  close_if_last_window = true,
  window = {
    width = 30,
  },
  filesystem = {
    filtered_items = {
      visible = false,
      hide_dotfiles = false,
      hide_gitignored = false,
    },
    follow_current_file = {
      enabled = true,
    },
  },
})
