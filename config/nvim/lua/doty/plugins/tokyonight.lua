local cfg = require("doty.config")
local colors = cfg.colors

require("tokyonight").setup({
  -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  style = "moon",
  light_style = "night", -- The theme is used when the background is set to light
  -- Enable this to disable setting the background color
  transparent = vim.g.transparent_enabled,
  -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
  terminal_colors = true,
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = {
      bg = "NONE",
      ctermbg = "NONE",
      ctermfg = "NONE",
      italic = true,
    },
    keywords = {
      bg = "NONE",
      ctermbg = "NONE",
      ctermfg = "NONE",
      bold = true,
    },
    functions = { bold = true },
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark",         -- style for sidebars, see below
    floats = "dark",           -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  -- day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  -- dim_inactive = false, -- dims inactive windows
  lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param clr ColorScheme
  on_colors = function(clr)
    clr.bg = colors.palette.bg
    clr.fg = colors.palette.fg
    clr.comment = colors.palette.comment

    clr.git.add = colors.palette.vcs_added
    clr.git.change = colors.palette.vcs_modified
    clr.git.delete = colors.palette.vcs_removed

    clr.blue = colors.palette.blue
    clr.cyan = colors.palette.cyan
    clr.green = colors.palette.green
    clr.magenta = colors.palette.magenta
    clr.orange = colors.palette.orange
    clr.purple = colors.palette.purple
    clr.red = colors.palette.red
    clr.yellow = colors.palette.yellow
  end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param hl Highlights
  ---@param c ColorScheme
  -- on_highlights = function(hl, c)
  --   local prompt = "#2d3149"
  --   --     -- borderless Telescope
  --   --     hl.TelescopeNormal = {bg = c.bg_dark, fg = c.fg_dark}
  --   --     hl.TelescopeBorder = {bg = c.bg_dark, fg = c.bg_dark}
  --   hl.TelescopePromptNormal = { bg = prompt }
  --   hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
  --   hl.TelescopePromptTitle = { bg = prompt, fg = prompt }
  --   hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
  --   hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
  -- end
})
