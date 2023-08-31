local navbuddy = require("nvim-navbuddy")
local lsp_status = require("lsp-status")
-- Setup language servers.
local lspconfig = require("lspconfig")

lspconfig.clangd.setup {
    handlers = lsp_status.extensions.clangd.setup(),
    init_options = {clangdFileStatus = true},
    on_attach = function(client, bufnr)
        navbuddy.attach(client, bufnr)
        lsp_status.on_attach(client, bufnr)
    end,
    capabilities = lsp_status.capabilities
}

-- lspconfig.pyls_ms.setup({
--     handlers = lsp_status.extensions.pyls_ms.setup(),
--     settings = {python = {workspaceSymbols = {enabled = true}}},
--     on_attach = lsp_status.on_attach,
--     capabilities = lsp_status.capabilities
-- })

-- lspconfig.ghcide.setup({
--     on_attach = lsp_status.on_attach,
--     capabilities = lsp_status.capabilities
-- })
-- lspconfig.rust_analyzer.setup({
--     on_attach = lsp_status.on_attach,
--     capabilities = lsp_status.capabilities
-- })

-- lspconfig.pyright.setup {}
-- lspconfig.tsserver.setup {}
-- lspconfig.rust_analyzer.setup {
--     -- Server-specific settings. See `:help lspconfig-setup`
--     settings = {['rust-analyzer'] = {}}
-- }

-- -- Global mappings.
-- -- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- -- Use LspAttach autocommand to only map the following keys
-- -- after the language server attaches to the current buffer
-- vim.api.nvim_create_autocmd('LspAttach', {
--     group = vim.api.nvim_create_augroup('UserLspConfig', {}),
--     callback = function(ev)
--         -- Enable completion triggered by <c-x><c-o>
--         vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

--         -- Buffer local mappings.
--         -- See `:help vim.lsp.*` for documentation on any of the below functions
--         local opts = {buffer = ev.buf}
--         vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
--         vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
--         vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--         vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
--         vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
--         vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
--         vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder,
--                        opts)
--         vim.keymap.set('n', '<space>wl', function()
--             print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--         end, opts)
--         vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
--         vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
--         vim.keymap.set({'n', 'v'}, '<space>ca', vim.lsp.buf.code_action, opts)
--         vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
--         vim.keymap.set('n', '<space>f',
--                        function() vim.lsp.buf.format {async = true} end, opts)
--     end
-- })
