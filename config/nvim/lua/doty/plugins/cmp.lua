local cmp = require 'cmp'
-- local luasnip = require('luasnip')
-- local lspkind = require('lspkind')

-- local ok, lspkind = pcall(require, "lspkind")
-- if not ok then
--   return
-- end

-- lspkind.init {
--   symbol_map = {
--     Copilot = "",
--   },
-- }
-- vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

cmp.setup({
    --   snippet = {
    --     expand = function(args)
    --       require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    --     end,
    --   },
    mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item {
            behavior = cmp.SelectBehavior.Insert
        },
        ["<C-p>"] = cmp.mapping.select_prev_item {
            behavior = cmp.SelectBehavior.Insert
        },
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-y>"] = cmp.mapping(cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true
        }, {"i", "c"}),
        ["<M-y>"] = cmp.mapping(cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false
        }, {"i", "c"}),

        ["<C-Space>"] = cmp.mapping {
            i = cmp.mapping.complete(),
            c = function(_ --[[fallback]] )
                if cmp.visible() then
                    if not cmp.confirm {select = true} then
                        return
                    end
                else
                    cmp.complete()
                end
            end
        },

        -- ["<tab>"] = false,
        ["<tab>"] = cmp.config.disable,

        -- ["<tab>"] = cmp.mapping {
        --   i = cmp.config.disable,
        --   c = function(fallback)
        --     fallback()
        --   end,
        -- },

        -- Testing
        ["<C-q>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false
        },

        ['<C-c>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({select = true}) -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        -- ['<c-d>'] = cmp.mapping(function(fallback)
        --   if luasnip.jumpable(1) then
        --     luasnip.jump(1)
        --   else
        --     fallback()
        --   end
        -- end, { "i", "s" }),
        -- ['<c-b>'] = cmp.mapping(function(fallback)
        --   if luasnip.jumpable(-1) then
        --     luasnip.jump(-1)
        --   else
        --     fallback()
        --   end
        -- end,
        --  { "i", "s" })
    }),
    -- If you want tab completion :'(
    --  First you have to just promise to read `:help ins-completion`.
    --
    -- ["<Tab>"] = function(fallback)
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   else
    --     fallback()
    --   end
    -- end,
    -- ["<S-Tab>"] = function(fallback)
    --   if cmp.visible() then
    --     cmp.select_prev_item()
    --   else
    --     fallback()
    --   end
    -- end,

    -- Youtube: mention that you need a separate snippets plugin
    -- snippet = {
    --   expand = function(args)
    --     require("luasnip").lsp_expand(args.body)
    --   end,
    -- },

    -- Youtube:
    --    the order of your sources matter (by default). That gives them priority
    --    you can configure:
    --        keyword_length
    --        priority
    --        max_item_count
    --        (more?)
    -- sources = cmp.config.sources({
    -- {name = "nvim_lua"},
    -- {name = "nvim_lsp"},
    -- {name = "luasnip"},
    -- {name = "copilot"},
    -- {name = "eruby"}
    -- }, {
    -- {name = "path"},
    -- {name = "buffer", keyword_length = 5}},
    -- {{name = "gh_issues"}
    -- }),
    -- sources = cmp.config.sources({
    --     {
    --         name = 'nvim_lsp',
    --         entry_filter = function(entry)
    --             return
    --                 require('cmp.types').lsp.CompletionItemKind[entry:get_kind()] ~=
    --                     'Text'
    --         end
    --     }, {name = 'luasnip'} -- For luasnip users.
    -- }, {{name = 'buffer'}}),
    -- formatting = {
    -- -- Youtube: How to set up nice formatting for your sources.
    -- format = lspkind.cmp_format {
    --     with_text = true,
    --     menu = {
    --       buffer = "[buf]",
    --       nvim_lsp = "[LSP]",
    --       nvim_lua = "[api]",
    --       path = "[path]",
    --       luasnip = "[snip]",
    --       gh_issues = "[issues]",
    --       tn = "[TabNine]",
    --       eruby = "[erb]",
    --     },
    --   },
    --     format = function(entry, vim_item)
    --         if vim.tbl_contains({'path'}, entry.source.name) then
    --             local icon, hl_group = require('nvim-web-devicons').get_icon(
    --                                        entry:get_completion_item().label)
    --             if icon then
    --                 vim_item.kind = icon
    --                 vim_item.kind_hl_group = hl_group
    --                 return vim_item
    --             end
    --         end
    --         return lspkind.cmp_format({with_text = true})(entry, vim_item)
    --     end
    -- },

    sorting = {
        -- TODO: Would be cool to add stuff like "See variable names before method names" in rust, or something like that.
        comparators = {
            cmp.config.compare.offset, cmp.config.compare.exact,
            cmp.config.compare.score,

            -- copied from cmp-under, but I don't think I need the plugin for this.
            -- I might add some more of my own.
            function(entry1, entry2)
                local _, entry1_under = entry1.completion_item.label:find "^_+"
                local _, entry2_under = entry2.completion_item.label:find "^_+"
                entry1_under = entry1_under or 0
                entry2_under = entry2_under or 0
                if entry1_under > entry2_under then
                    return false
                elseif entry1_under < entry2_under then
                    return true
                end
            end, cmp.config.compare.kind, cmp.config.compare.sort_text,
            cmp.config.compare.length, cmp.config.compare.order
        }
    },

    experimental = {
        -- I like the new menu better! Nice work hrsh7th
        native_menu = false,

        -- Let's play with this for a day or two
        ghost_text = false
    }
})

-- cmp.setup.filetype('gitcommit', {
--     sources = cmp.config.sources({
--         {name = 'cmp_git'} -- You can specify the `cmp_git` source if you were installed it.
--     }, {{name = 'buffer'}})
-- })

-- cmp.setup.cmdline("/", {
--   completion = {
--     -- Might allow this later, but I don't like it right now really.
--     -- Although, perhaps if it just triggers w/ @ then we could.
--     --
--     -- I will have to come back to this.
--     autocomplete = false,
--   },
--   sources = cmp.config.sources({
--     { name = "nvim_lsp_document_symbol" },
--   }, {
--     -- { name = "buffer", keyword_length = 5 },
--   }),
-- })

-- cmp.setup.cmdline(":", {
--   completion = {
--     autocomplete = false,
--   },
--
--   sources = cmp.config.sources({
--     {
--       name = "path",
--     },
--   }, {
--     {
--       name = "cmdline",
--       max_item_count = 20,
--       keyword_length = 4,
--     },
--   }),
-- })

--[[
" Setup buffer configuration (nvim-lua source only enables in Lua filetype).
"
" ON YOUTUBE I SAID: This only _adds_ sources for a filetype, not removes the global ones.
"
" BUT I WAS WRONG! This will override the global setup. Sorry for any confusion.
autocmd FileType lua lua require'cmp'.setup.buffer {
\   sources = {
\     { name = 'nvim_lua' },
\     { name = 'buffer' },
\   },
\ }
--]]

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
