local cfg = require("doty.config")
local colorbuddy = require("colorbuddy")

colorbuddy.setup()
-- Set colorscheme after options
colorbuddy.colorscheme(cfg.theme)
vim.cmd.colorscheme(cfg.theme)
