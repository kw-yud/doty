local hooks = require("ibl.hooks")
local colors = require("doty.config").colors.palette

-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowRed", { fg = colors.red })
  vim.api.nvim_set_hl(0, "RainbowYellow", { fg = colors.yellow })
  vim.api.nvim_set_hl(0, "RainbowBlue", { fg = colors.blue })
  vim.api.nvim_set_hl(0, "RainbowOrange", { fg = colors.orange })
  vim.api.nvim_set_hl(0, "RainbowGreen", { fg = colors.green })
  vim.api.nvim_set_hl(0, "RainbowViolet", { fg = colors.violet })
  vim.api.nvim_set_hl(0, "RainbowCyan", { fg = colors.cyan })
end)

local rainbow_hl = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowOrange",
  "RainbowGreen",
  "RainbowViolet",
  "RainbowCyan",
}

local highlight = {
  -- "hl-IblIndent",
  "CursorColumn",
  "Whitespace",
}

require("ibl").setup({
  indent = {
    -- Alternatives: ~
    -- • left aligned solid
    --   • `▏`
    --   • `▎` (default)
    --   • `▍`
    --   • `▌`
    --   • `▋`
    --   • `▊`
    --   • `▉`
    --   • `█`
    -- • center aligned solid
    --   • `│`
    --   • `┃`
    -- • right aligned solid
    --   • `▕`
    --   • `▐`
    -- • center aligned dashed
    --   • `╎`
    --   • `╏`
    --   • `┆`
    --   • `┇`
    --   • `┊`
    --   • `┋`
    -- • center aligned double
    --   • `║`
    char = "",
    highlight = highlight,
    smart_indent_cap = true,
  },
  whitespace = {
    highlight = highlight,
    remove_blankline_trail = false,
  },
  scope = {
    enabled = true,
    show_start = true,
    show_end = true,
    injected_languages = true,
    highlight = rainbow_hl,
    priority = 500,
  },
  exclude = {
    filetypes = {
      "",
      "alpha",
      "checkhealth",
      "dashboard",
      "floaterm",
      "gitcommit",
      "help",
      "lazy",
      "lspinfo",
      "man",
      "NvimTree",
      "packer",
      "TelescopePrompt",
      "TelescopeResults",
      "Trouble",
    },
    buftypes = {
      "nofile",
      "prompt",
      "quickfix",
      "terminal",
    },
  },
})
