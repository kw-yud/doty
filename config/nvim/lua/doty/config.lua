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
  lsp = "",

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

  -- Collapsible
  collapsible_open = "", -- icon used for open folds
  collapsible_closed = "", -- icon used for closed folds

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
    },
    diff = {
      add = '',
      change = '󰝤',
      delete = '',
    }
  },

  vim_mode = {
    NORMAL = "󰒂",
    INSERT = "󱅄",
    VISUAL = "",
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
    "bash",
    "c", "cmake", "comment", "csv",
    "dockerfile",
    "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore",
    "go", "gomod", "gosum", "gowork",
    "html",
    "ini", "jq", "json", "json5",
    "lua", "luadoc",
    "make", "markdown", "markdown_inline",
    "proto",
    "python",
    "query", "regex",
    "rust",
    "sql",
    "toml", "todotxt",
    "typescript", "tsx",
    "vim", "vimdoc",
    "yaml",
  },
  comments = { c = "// %s", go = "// %s", lua = "-- %s" },
  indent = {
    enable = true,
  },
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

M.colors = {
  bg = { sidebar = "#1f2430" },
  fg = {
    git = { ignore = "#707a8c" },
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
