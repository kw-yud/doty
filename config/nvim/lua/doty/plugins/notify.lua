local cfg = require("doty.config")
local icons = cfg.icons

-- local nonicons_extention = require("nvim-nonicons.extentions.nvim-notify")

return {
    background_colour = "#df8882",
    icons = {
        ERROR = icons.error,
        WARN = icons.warning,
        INFO = icons.info,
        DEBUG = icons.debug,
        TRACE = icons.trace
    },
    -- icons = nonicons_extention.icons,
    timeout = 3000,
    max_height = function() return math.floor(vim.o.lines * 0.75) end,
    max_width = function() return math.floor(vim.o.columns * 0.75) end
}
