local cfg = require("doty.config")
local icons = cfg.icons
local colors = cfg.colors

require("notify").setup({
  background_colour = colors.palette.bg,
  icons = {
    ERROR = icons.error,
    WARN = icons.warning,
    INFO = icons.info,
    DEBUG = icons.debug,
    TRACE = icons.trace,
  },
  timeout = 5000,
})
