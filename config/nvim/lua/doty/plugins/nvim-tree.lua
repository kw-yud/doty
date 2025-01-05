local icons = require("doty.config").icons

require("nvim-tree").setup({
  actions = {
    open_file = {
      quit_on_open = false,
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    debounce_delay = 50,
    icons = {
      hint = icons.hint,
      info = icons.info,
      warning = icons.warning,
      error = icons.error,
    },
  },

  view = {
    width = 40,
    number = true,
    relativenumber = false,
  },
  -- respect_buf_cwd = true,
  renderer = {
    group_empty = true,
    highlight_git = true,
    special_files = {},
    icons = {
      glyphs = {
        default = "",
        symlink = icons.symlink,
        git = icons.git.state,
        folder = icons.folder,
      },
    },
  },
})
