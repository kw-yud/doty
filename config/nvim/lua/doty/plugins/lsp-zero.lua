local lsp_status = require("lsp-status")
local lsp_zero = require("lsp-zero")
local icons = require("doty.config").icons
local keymap = require("doty.utils.functions").keymap

lsp_zero.set_server_config({
  capabilities = vim.tbl_deep_extend("force", {
    textDocument = {
      -- Tell the server the capability of foldingRange,
      -- Neovim hasn't added foldingRange to default capabilities, users must add it manually
      foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      },
    },
  }, lsp_status.capabilities),
})

lsp_zero.format_on_save({
  format_opts = { async = false, timeout_ms = 10000 },
  servers = {
    ["lua_ls"] = { "lua" },
    ["rust_analyzer"] = { "rust" },
    ["gopls"] = { "go" },
  },
})

lsp_zero.set_preferences({ suggest_lsp_servers = false })

-----------------------------------------------------------
-- UI settings
-----------------------------------------------------------
-- In `v3.x` lsp-zero doesn't configure diagnostics anymore,
-- you just get the default Neovim behaviour.
-- If you want to get the icons and the config, add this code.
local border_style = vim.g.lsp_zero_ui_float_border
if border_style == nil then
  border_style = "rounded"
end

if type(border_style) == "string" then
  vim.diagnostic.config({
    virtual_text = false,
    severity_sort = true,
    signs = true,
    underline = true,
    update_in_insert = true,
    float = {
      focusable = false,
      style = "minimal",
      border = border_style,
      source = "always",
      header = "",
      prefix = "",
    },
  })
end

lsp_zero.set_sign_icons({
  hint = icons.hint,
  info = icons.info,
  warning = icons.warning,
  error = icons.error,
})

