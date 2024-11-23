local transparent = require("transparent")

transparent.setup {
  -- table: default groups
  groups = {
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String',
    'Function', 'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr',
    'NonText', 'SignColumn', 'CursorLineNr', 'EndOfBuffer'
  },
  -- table/string: additional groups that should be cleared
  extra_groups = { "Comment" },
  exclude_groups = {} -- table: groups you don't want to clear
}
transparent.toggle(false)
