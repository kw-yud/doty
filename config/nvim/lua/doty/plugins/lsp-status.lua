local lsp_status = require('lsp-status')
local icons = require("doty.config").icons
-- completion_customize_lsp_label as used in completion-nvim
-- Optional: customize the kind labels used in identifying the current function.
-- g:completion_customize_lsp_label is a dict mapping from LSP symbol kind
-- to the string you want to display as a label
-- lsp_status.config { kind_labels = vim.g.completion_customize_lsp_label }

-- Register the progress handler
lsp_status.register_progress()

-- Put this somewhere near lsp_status.register_progress()
lsp_status.config({
  indicator_errors = ' ' .. icons.error,
  indicator_warnings = ' ' .. icons.warning,
  indicator_info = ' ' .. icons.info,
  indicator_hint = ' ' .. icons.hint,
  indicator_ok = ' ' .. icons.ok
})
