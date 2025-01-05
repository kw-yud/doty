local colors = require("doty.config").colors

require("ayu.colors").generate(true) -- Pass `true` to enable mirage
require("ayu").setup({
  mirage = true,                     -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
  overrides = {
    -- Base.
    ErrorMsg = { fg = colors.fg.error },
    SpellBad = { sp = colors.fg.error, undercurl = true },
    Error = { fg = colors.white, bg = colors.fg.error },
    qfError = { fg = colors.fg.error },

    -- LSP.
    DiagnosticError = { fg = colors.fg.error },
    DiagnosticUnderlineError = { sp = colors.fg.error, undercurl = true },

    -- NvimTree.
    NvimTreeGitMerge = { fg = colors.fg.error },

    -- Notify.
    NotifyERRORTitle = { fg = colors.fg.error },
    NotifyWARNTitle = { fg = colors.fg.warning },
    NotifyINFOTitle = { fg = colors.fg.info },

    -- DAP UI.
    DapUIWatchesError = { fg = colors.fg.error },
  },
})
