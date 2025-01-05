local buffers = require("doty.utils.buffers")
local cmp = require("cmp")
local lsp_zero = require("lsp-zero")
local cmp_action = lsp_zero.cmp_action()
local icons = require("doty.config").icons
local autocmd_group =
    vim.api.nvim_create_augroup("DotyNvimCMP", { clear = true })

require("luasnip.loaders.from_vscode").lazy_load()

local cmp_source_lsp = {
  { name = "nvim_lsp" },
  -- {
  --   name = 'nvim_lsp',
  --   entry_filter = function(entry)
  --     return
  --         require('cmp.types').lsp.CompletionItemKind[entry:get_kind()] ~=
  --         'Text'
  --   end
  -- },
  { name = "luasnip",   option = { show_autosnippets = true } }, -- For luasnip users.
  -- TODO: Should be registered for specified FileType?
  { name = "nvim_lua" },
  -- TODO: Should be registered for specified FileType?
}

local cmp_source_commons = {
  { name = "path" },
  { name = "buffer", keyword_length = 3 },
  -- { name = "copilot" },
}

cmp.setup({
  -- Youtube: mention that you need a separate snippets plugin
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
    completion = cmp.config.window.bordered({
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
    }),
    documentation = cmp.config.window.bordered({
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
    }),
  },
  -- If you want tab completion :'(
  -- First you have to just promise to read `:help ins-completion`.
  mapping = cmp.mapping.preset.insert({
    -- scroll documentation window
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4)),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4)),

    -- navigate between snippet placeholder
    -- Go to the next placeholder in a snippet created by the module vim.snippet.
    ["<C-d>"] = cmp_action.luasnip_jump_forward(),
    -- Go to the previous placeholder in a snippet created by the module
    ["<C-u>"] = cmp_action.luasnip_jump_backward(),

    -- Enables completion when the cursor is inside a word. If the completion
    -- menu is visible it will navigate to the next item in the list. If the
    -- line is empty it uses the fallback.
    -- ["<Tab>"] = cmp_action.tab_complete(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      local luasnip = require("luasnip")
      local col = vim.fn.col(".") - 1

      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      elseif buffers.has_words_before() then
        cmp.complete()
      elseif col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
        fallback()
      else
        cmp.complete()
      end
    end, { "i", "s" }),
    -- If the completion menu is visible navigate to the previous item
    -- in the list. Else, uses the fallback.
    ["<S-Tab>"] = cmp_action.select_prev_or_fallback(),

    ["<Up>"] = cmp.mapping(
      cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      { "i", "c" }
    ),
    ["<Down>"] = cmp.mapping(
      cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      { "i", "c" }
    ),

    ["<Esc>"] = cmp.mapping(cmp.mapping.abort()),
    -- Accept currently selected item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping(cmp.mapping.confirm({ select = true })),

    ["<C-y>"] = cmp.mapping(
      cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      }),
      { "i", "c" }
    ),
    ["<M-y>"] = cmp.mapping(
      cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      }),
      { "i", "c" }
    ),
  }),

  -- Youtube:
  --    the order of your sources matter (by default). That gives them priority
  --    you can configure:
  --        keyword_length
  --        priority
  --        max_item_count
  --        (more?)
  sources = cmp.config.sources(cmp_source_lsp, cmp_source_commons),

  formatting = {
    fields = { "abbr", "kind", "menu" },
  },

  sorting = {
    -- TODO: Would be cool to add stuff like "See variable names before method names" in rust, or something like that.
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      -- The default sorting order is last updated (for Git PRs, MRs and issues) and latest (for commits).
      -- To make `nvim-cmp` sort in this order, move `cmp.config.compare.sort_text` closer to
      -- the top of (lower index) in `sorting.comparators`.
      cmp.config.compare.sort_text,
      cmp.config.compare.score,

      -- copied from cmp-under, but I don't think I need the plugin for this.
      -- I might add some more of my own.
      function(entry1, entry2)
        local _, entry1_under = entry1.completion_item.label:find("^_+")
        local _, entry2_under = entry2.completion_item.label:find("^_+")
        entry1_under = entry1_under or 0
        entry2_under = entry2_under or 0
        if entry1_under > entry2_under then
          return false
        elseif entry1_under < entry2_under then
          return true
        end
      end,

      cmp.config.compare.recently_used,
      cmp.config.compare.kind,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },

  experimental = {
    -- I like the new menu better! Nice work hrsh7th
    native_menu = false,

    -- Let's play with this for a day or two
    ghost_text = {
      hl_group = "LspCodeLens",
    },
  },
})

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
-- cmp.setup.filetype({ "gitcommit", "markdown" }, {
--   sources = cmp.config.sources({
--     { name = "git" }, -- You can specify the `cmp_git` source if you were installed it.
--   }, cmp_source_commons),
-- })

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline({ "/", "?" }, {
--   completion = {
--     -- Might allow this later, but I don't like it right now really.
--     -- Although, perhaps if it just triggers w/ @ then we could.
--     --
--     -- I will have to come back to this.
--     autocomplete = false,
--   },
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = cmp.config.sources({
--     { name = "nvim_lsp_document_symbol" },
--   }, {
--     -- { name = "buffer", keyword_length = 5 },
--   }),
-- })

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(":", {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = cmp.config.sources({
--     { name = "path" },
--   }, {
--     {
--       name = "cmdline",
--       max_item_count = 20,
--       keyword_length = 4,
--       option = {
--         ignore_cmds = { "Man", "!" },
--       },
--     },
--   }),
-- })

-- Setup buffer configuration (nvim-lua source only enables in Lua filetype).
-- ON YOUTUBE I SAID: This only _adds_ sources for a filetype, not removes the global ones.
-- BUT I WAS WRONG! This will override the global setup. Sorry for any confusion.
-- vim.api.nvim_create_autocmd("FileType", {
--   group = autocmd_group,
--   pattern = { "lua" },
--   desc = "Set up nvim-ts-context-commentstring for each buffer that has Treesitter active",
--   callback = require("cmp").setup.buffer({
--     sources = {
--       { name = "nvim_lua" },
--       { name = "buffer" },
--     },
--   }),
-- })

-- Add vim-dadbod-completion in sql files
-- _ = vim.cmd [[
--   augroup DadbodSql
--     au!
--     autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer { sources = { { name = 'vim-dadbod-completion' } } }
--   augroup END
-- ]]

-- _ = vim.cmd [[
--   augroup CmpZsh
--     au!
--     autocmd Filetype zsh lua require'cmp'.setup.buffer { sources = { { name = "zsh" }, } }
--   augroup END
-- ]]
