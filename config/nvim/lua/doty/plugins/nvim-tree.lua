local cfg = require("doty.config")
local icons = cfg.icons

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    actions = {open_file = {quit_on_open = true}},
    update_focused_file = {enable = true, update_cwd = true},
    filters = {custom = {'^.git$', '^node_modules$'}},
    git = {enable = false},
    log = {enable = true, types = {diagnostics = true}},
    diagnostics = {
        enable = true,
        show_on_dirs = false,
        debounce_delay = 50,
        icons = {hint = '', info = '', warning = '', error = ''}
    },

    view = {width = 45, number = true, relativenumber = true},
    -- respect_buf_cwd = true,
    renderer = {
        group_empty = false,
        highlight_git = true,
        special_files = {},
        icons = {
            glyphs = {
                default = '',
                symlink = icons.symlink,
                git = icons.git.state,
                folder = icons.folder
            }
        }
    }
})
