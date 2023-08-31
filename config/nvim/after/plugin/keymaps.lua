local wk = require("which-key")

-- buffer navigation
-- nmap('<leader>bp', ':bprev<cr>', { desc = 'Prev buffer' })
-- nmap('<leader>bn', ':bnext<cr>', { desc = 'Next buffer' })
-- nmap('<leader>bd', ':bdelete<cr>', { desc = 'Delete buffer' })

-- tab navigation
-- nmap('<leader>tp', ':tabprevious<cr>', { desc = 'Prev tab' })
-- nmap('<leader>tn', ':tabnext<cr>', { desc = 'Next tab' })
-- nmap('<leader>td', ':tabclose<cr>', { desc = 'Close tab' })

-- tab navigation
-- nmap('<leader>tp', ':tabprevious<cr>', { desc = 'Prev tab' })
-- nmap('<leader>tn', ':tabnext<cr>', { desc = 'Next tab' })
-- nmap('<leader>td', ':tabclose<cr>', { desc = 'Close tab' })

-- Breadcrumb
wk.register({
    ["<leader>ub"] = {
        function()
            local off = vim.b['barbecue_entries'] == nil
            require('barbecue.ui').toggle(off and true or nil)
        end, "Toogle Breadcrumbs"
    }
})

-- Lazy plugin management
wk.register({
    ["<leader>p"] = {
        name = "Plugin Management",
        c = {'<cmd>Lazy check<cr>', 'Check plugins'},
        u = {'<cmd>Lazy update<cr>', 'Update plugins'},
        s = {'<cmd>Lazy show<cr>', 'Show plugins'},
        p = {'<cmd>Lazy profile<cr>', 'Profile'},
        l = {'<cmd>Lazy logs<cr>', 'Logs'},
        r = {'<cmd>Lazy restore<cr>', 'Restore plugins from lockfile'},
        x = {'<cmd>Lazy clear<cr>', 'Clear uninstalled plugins'},
        h = {'<cmd>Lazy help<cr>', 'Show Help'}
    }
})

-- Nvim-Tree
local nvtree_api = require('nvim-tree.api')
wk.register({
    ["<leader>e"] = {
        function()
            local api = require('nvim-tree.api')

            if api.tree.is_visible then
                api.tree.open()
                api.tree.focus()
            else
                api.tree.close()
            end
        end, "Toogle tree"
    },
    -- ["q"] = {function() require('nvim-tree.api').tree.close() end, "Close tree"},
    ["-"] = {
        function() require('nvim-tree.api').tree.collapse_all() end,
        "Collapse all tree"
    }
})

-- nmap('<c-a>', 'gg<S-v>G')
-- nmap('<leader>k', '<cmd>Lspsaga hover_doc<CR>')
-- keymap.set({ 'n', 'v' }, '<leader>ca', '<cmd>Lspsaga code_action<CR>')
-- nmap('gd', '<cmd>Lspsaga goto_definition<CR>')
-- nmap('[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>')
-- nmap(']d', '<cmd>Lspsaga diagnostic_jump_next<CR>')
-- nmap('<leader>o', '<cmd>Lspsaga outline<CR>')
-- nmap('gh', '<cmd>Lspsaga lsp_finder<CR>')
-- nmap('<leader>rn', '<cmd>Lspsaga rename<CR>')

-- Cheatsheet through folke/neodev.nvim
wk.register({["<leader>ch"] = {"<cmd>WhichKey<cr>", "Show cheatsheet"}})

-- make test for golang
-- nmap('<leader>gt', '<cmd>GoTests<CR>')

-- presentation
-- nmap('<leader>pp', '<cmd>PresentingStart<CR>')
-- nmap('n', '<cmd>PresentingNext<CR>')
-- nmap('b', '<cmd>PresentingPrev<CR>')

-- Telescope
wk.register({
    ["<leader>f"] = {
        name = "File",
        n = {"<cmd>enew<cr>", "New File"},
        f = {"<cmd>Telescope find_files<cr>", "Find File"},
        r = {
            "<cmd>Telescope oldfiles<cr>",
            "Open Recent File",
            -- additional options for creating the keymap
            noremap = false
        }
    }
})

-- folke/noice.nvim
wk.register({
    ["<S-Enter>"] = {
        function() require('noice').redirect(vim.fn.getcmdline()) end,
        "Redirect Cmdline",
        mode = 'c'
    },
    ["<c-f>"] = {
        function()
            if not require('noice.lsp').scroll(4) then return '<c-f>' end
        end,
        'Scroll forward',
        silent = true,
        expr = true,
        mode = {'i', 'n', 's'}
    },
    ["<c-b>"] = {
        function()
            if not require('noice.lsp').scroll(-4) then
                return '<c-b>'
            end
        end,
        'Scroll backward',
        silent = true,
        expr = true,
        mode = {'i', 'n', 's'}
    },
    ["<leader>sn"] = {
        l = {function() require('noice').cmd('last') end, 'Noice Last Message'},
        h = {function() require('noice').cmd('history') end, 'Noice History'},
        a = {function() require('noice').cmd('all') end, 'Noice All'}
    }
})

-- rcarriga/nvim-notify
wk.register({
    ['<leader>un'] = {
        function()
            require('notify').dismiss({silent = true, pending = true})
        end, 'Dismiss all Notifications'
    }
})

-- Trouble
wk.register({
    ["<leader>x"] = {
        name = "Trouble",
        x = {"<cmd>TroubleToggle<cr>", "Toggle trouble"},
        w = {
            "<cmd>TroubleToggle workspace_diagnostics<cr>",
            "Diagnostics workspace"
        },
        d = {
            "<cmd>TroubleToggle document_diagnostics<cr>",
            "Diagnostics document"
        },
        l = {"<cmd>TroubleToggle loclist<cr>", "List"},
        f = {"<cmd>TroubleToggle quickfix<cr>", "Quick fix"}
    },
    ["gR"] = {"<cmd>TroubleToggle lsp_references<cr>", "LSP reference"}
})

---- Neogit ---------------------------------

-- vim.fn["gina#custom#command#option"]('status', '--opener', 'vsplit')
-- nnoremap { '<leader>gs', '<cmd>Gina status<CR>' }

wk.register({
    ["<leader>g"] = {
        name = "Git",
        d = {"<cmd>DiffviewOpen<cr>", "Git diff"},
        s = {function() require("neogit").open() end, "Git show"},
        c = {function() require("neogit").open {"commit"} end, "Git commit"}
    }
})

-- TODO: decide mappings for this
-- local nnoremap = vim.keymap.nnoremap
-- nnoremap { "<space>tsw", require("gitsigns").toggle_word_diff }
-- nnoremap { "<space>tsh", require("gitsigns").toggle_word_diff }

---- Diagnostic ---------------------------------
wk.register({
    ["<leader>d"] = {
        name = "Diagnostic",
        s = {
            function() vim.diagnostic.open_float(0, {scope = "line"}) end,
            "Show diagnostic"
        },
        n = {
            function()
                vim.diagnostic.goto_next {
                    severity = get_highest_error_severity(),
                    wrap = true,
                    float = true
                }
            end, "Next diagnostic"
        },
        p = {
            function()
                vim.diagnostic.goto_prev {
                    severity = get_highest_error_severity(),
                    wrap = true,
                    float = true
                }
            end, "Previous diagnostic"
        }
    }
})
