require("gitblame").setup({
  enabled = true,     -- If you want to enable the plugin
  message_template = " <author>  <date>  <summary>",
  date_format = "%r", -- Template for the date, check Date format section for more options
  -- virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
  message_when_not_committed = "  Not Committed Yet",
  highlight_group = "Comment",
  clipboard_register = "+",
})
