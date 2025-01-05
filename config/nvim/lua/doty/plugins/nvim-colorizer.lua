-- Attach to certain Filetypes, add special configuration for `html`
-- Use `background` for everything else.
require("colorizer").setup({
  "*", -- Highlight all files, but customize some others.
  html = { css = true, mode = "foreground" },
  scss = { css = true },
  css = { css = true },
  javascript = { no_names = true },
}, {
  RGB = true,          -- #RGB hex codes
  RRGGBB = true,       -- #RRGGBB hex codes
  names = true,        -- "Name" codes like Blue
  RRGGBBAA = true,     -- #RRGGBBAA hex codes
  -- Available modes: foreground, background
  mode = "background", -- Set the display mode.
})
