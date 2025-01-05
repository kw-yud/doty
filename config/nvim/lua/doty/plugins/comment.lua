-- TODO: Find out where is the keymap come from?
-- vim.keymap.del({'n', 'x'}, 'gc')

require("Comment").setup({
  ---Add a space b/w comment and the line
  padding = true,

  -- Create basic (operator-pending) and extended mappings for NORMAL + VISUAL mode
  mappings = {
    -- operator-pending mapping
    -- Includes:
    --  `gcc`               -> line-comment  the current line
    --  `gcb`               -> block-comment the current line
    --  `gc[count]{motion}` -> line-comment  the region contained in {motion}
    --  `gb[count]{motion}` -> block-comment the region contained in {motion}
    basic = true,

    -- extra mapping
    -- Includes `gco`, `gcO`, `gcA`
    extra = true,
  },

  -- LHS of operator-mode mappings in NORMAL and VISUAL mode
  opleader = {
    -- line-comment keymap
    line = "gc",
    -- block-comment keymap
    block = "gb",
  },

  -- LHS of toggle mappings in NORMAL
  toggler = {
    -- line-comment keymap
    -- Makes sense to be related to your opleader.line
    line = "gcc",

    -- block-comment keymap
    -- Make sense to be related to your opleader.block
    block = "gbc",
  },

  -- LHS of extra mappings
  extra = {
    -- Inserts comment above
    above = "gcO",
    -- Inserts comment below
    below = "gco",
    -- Inserts comment at the end of line
    eol = "gcA",
  },

  -- Pre-hook, called before commenting the line
  --    Can be used to determine the commentstring value
  pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),

  -- Post-hook, called after commenting is done
  --    Can be used to alter any formatting / newlines / etc. after commenting
  -- post_hook = nil,

  -- Can be used to ignore certain lines when doing linewise motions.
  -- - Can be string (lua regex)
  -- - Or function (that returns lua regex)
  -- ignore = function()
  --   -- Only ignore empty lines for lua files
  --   if vim.bo.filetype == 'lua' then
  --     return '^$'
  --   end

  --   return '^$'
  -- end,
})

local comment = require("Comment.ft")

comment
    .set("lua", { "--%s", "--[[%s]]" })
-- Set only line comment
    .set("yaml", "#%s")
-- Or set both line and block commentstring
    .set("javascript", { "//%s", "/*%s*/" })

-- Multiple filetypes
comment({ "go", "rust" }, comment.get("c"))
comment({ "toml", "graphql" }, "#%s")

vim.g.minicomment_disable = true
