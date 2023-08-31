local M = {}

M.icons = {
    file = "",
    module = "",
    namespace = "",
    package = "",
    class = "",
    method = "",
    property = "",
    field = "",
    constructor = "",
    enum = "",
    interface = "",
    functions = "",
    variable = "",
    constant = "",
    string = "",
    number = "",
    boolean = "",
    array = "",
    object = "",
    key = "",
    null = "",
    enumMember = "",
    struct = "",
    event = "",
    operator = "",
    typeParameter = "",

    -- Log level
    ok = "",
    error = "",
    warning = "",
    info = "",
    debug = "",
    trace = "✎",
    unknown_level = "",

    -- Comment
    fix = "",
    todo = "",
    hack = "",
    performance = "",
    hint = "",
    test = "⏲",

    -- Collapsable
    collapsable_open = "", -- icon used for open folds
    collapsable_closed = "", -- icon used for closed folds

    symlink = '',

    folder = {
        arrow_open = '',
        arrow_closed = '',
        default = '',
        open = '',
        empty = '',
        empty_open = '',
        symlink = '',
        symlink_open = ''
    },

    git = {
        branch = "",
        state = {
            unstaged = '✗',
            staged = '✓',
            unmerged = '',
            renamed = '➜',
            untracked = '★',
            deleted = '',
            ignored = '◌'
        }
    },

    vim_mode = {
        NORMAL = "󰒂",
        INSERT = "󱅄",
        VISUAL = "󰈈",
        REPLACE = "",
        COMMAND = "",
        ["V-LINE"] = "󱂔"
    }
}

M.symbols = {
    ---Modification indicator.
    ---
    ---@type string
    modified = "●",

    ---Truncation indicator.
    ---
    ---@type string
    ellipsis = "…",

    ---Entry separator.
    ---
    ---@type string
    separator = ""
}

M.treesitter = {
    languages = {
        "bash", "go", "html", "json", "markdown", "markdown_inline", "python",
        "query", "regex", "rust", "yaml", "tsx", "vim", "vimdoc"
    },
    comments = {c = "// %s", go = "// %s", lua = "-- %s"}
}

M.colors = {
    bg = {sidebar = "#1f2430"},
    fg = {
        git = {ignore = "#707a8c"},
        diff = {
            add = "#87D96C",
            change = "#80BFFF",
            delete = "#F27983",
            text = "#394b70"
        },

        comment = "#5c6773",

        error = "#ff6666",
        info = "#5ccfe6",
        warning = "#ffcc66",
        hint = "#d5ff80",
        test = "#242936",
        unknown_title = "#7c3aed"
    }
}

M.theme = "ayu-mirage"

return M
