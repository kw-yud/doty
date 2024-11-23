vim.o.timeout = true
vim.o.timeoutlen = 300
require("which-key").setup {
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    ["<space>"] = "SPC",
    ["<cr>"] = "RET",
    ["<tab>"] = "TAB"
  },
  icons = {
    breadcrumb = "󰄾", -- symbol used in the command line area that shows your active key combo
    separator = "", -- symbol used between a key and it's label
    group = " " -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>"    -- binding to scroll up inside the popup
  },
  window = {
    border = "shadow",        -- none, single, double, shadow
    position = "bottom",      -- bottom, top
    margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
    padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 15,            -- value between 0-100 0 for fully opaque and 100 for fully transparent
    zindex = 1000             -- positive value to position WhichKey above other floating windows.
  }
}
