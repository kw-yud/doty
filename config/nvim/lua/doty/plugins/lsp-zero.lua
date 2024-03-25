local lsp_zero = require('lsp-zero')

-- Setup language servers.
lsp_zero.extend_lspconfig()

lsp_zero.format_on_save({
  format_opts = { async = false, timeout_ms = 10000 },
  servers = {
    ['lua_ls'] = { 'lua' },
    ['rust_analyzer'] = { 'rust' },
    ['gopls'] = { 'go' }
  }
})

lsp_zero.set_preferences({ suggest_lsp_servers = false })

lsp_zero.set_sign_icons({
  hint = '',
  info = '',
  warning = '',
  error = ''
})
