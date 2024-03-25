local lsp_zero = require('lsp-zero')
local lsp_status = require("lsp-status")
local navbuddy = require("nvim-navbuddy")
-- Setup language servers.
local lspconfig = require("lspconfig")
local masonlspconfig = require("mason-lspconfig")

-- lspconfig.util.default_config()
-- lspconfig.util.ensure_installed()
-- lspconfig.util.ensure_attached()

lspconfig.util.on_setup = lspconfig.util.add_hook_after(lspconfig.util.on_setup, function(config)
  if config.name == 'lua_ls' then
    -- workaround for nvim's incorrect handling of scopes in the workspace/configuration handler
    -- https://github.com/folke/neodev.nvim/issues/41
    -- https://github.com/LuaLS/lua-language-server/issues/1089
    -- https://github.com/LuaLS/lua-language-server/issues/1596
    -- https://github.com/LuaLS/lua-language-server/issues/1596#issuecomment-1855087288
    config.handlers = vim.tbl_extend('error', {}, config.handlers)
    config.handlers['workspace/configuration'] = function(...)
      local _, result, ctx = ...
      local client_id = ctx.client_id
      local client = vim.lsp.get_client_by_id(client_id)
      if client and client.workspace_folders and #client.workspace_folders then
        if result.items and #result.items > 0 then
          if not result.items[1].scopeUri then
            return vim.tbl_map(function(_) return nil end, result.items)
          end
        end
      end

      return vim.lsp.handlers['workspace/configuration'](...)
    end
  end
end)

masonlspconfig.setup_handlers {
  lsp_zero.default_setup,
  lspconfig.lua_ls.setup {
    settings = {
      Lua = {
        diagnostics = { globals = { "vim" } },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
          hint = { enable = true },
          telemetry = { enable = false }
        }
      }
    }
  },
  lspconfig.jsonls.setup {
    settings = {
      json = {
        -- schema = require('schemastore').json.schemas(),
        validate = { enable = true }
      }
    }
  },
  lspconfig.gopls.setup {
    settings = {
      gopls = {
        gofumpt = true,
        codelenses = {
          gc_details = false,
          generate = true,
          regenerate_cgo = true,
          run_govulncheck = true,
          test = true,
          tidy = true,
          upgrade_dependency = true,
          vendor = true
        },
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true
        },
        analyses = {
          fieldalignment = true,
          nilness = true,
          unusedparams = true,
          unusedwrite = true,
          useany = true
        },
        usePlaceholders = true,
        completeUnimported = true,
        staticcheck = true,
        directoryFilters = {
          "-.git", "-.vscode", "-.idea", "-.vscode-test",
          "-node_modules"
        }
      }
    }
  },
  lspconfig.terraformls.setup {
    cmd = { "terraform-ls", "serve" },
    filetypes = { "terraform", "tf", "terraform-vars" },
    -- root_dir = lspconfig.util.root_pattern(".terraform", ".git"),
    root_dir = lspconfig.util.root_pattern("*.tf", "*.terraform",
      "*.tfvars", "*.hcl", "*.config")
  },
  lspconfig.clangd.setup {
    handlers = lsp_status.extensions.clangd.setup(),
    init_options = { clangdFileStatus = true },
    on_attach = function(client, bufnr)
      navbuddy.attach(client, bufnr)
      lsp_status.on_attach(client, bufnr)
    end,
    capabilities = lsp_status.capabilities
  },
  -- lspconfig.robotframework_ls.setup {
  --   pythonpath = "~/.pyenv/shims/python"
  -- },
  -- setup helm-ls
  lspconfig.helm_ls.setup {
    settings = { ['helm-ls'] = { yamlls = { path = "yaml-language-server" } } }
  },                         -- setup yamlls
  lspconfig.yamlls.setup {}, -- lspconfig.pyls_ms.setup {
  --     handlers = lsp_status.extensions.pyls_ms.setup(),
  --     settings = {python = {workspaceSymbols = {enabled = true}}},
  --     on_attach = lsp_status.on_attach,
  --     capabilities = lsp_status.capabilities
  -- },
  -- lspconfig.ghcide.setup {
  --     on_attach = lsp_status.on_attach,
  --     capabilities = lsp_status.capabilities
  -- },
  -- lspconfig.pyright.setup {},
  -- lspconfig.tsserver.setup {},
  lspconfig.rust_analyzer.setup {
    -- Server-specific settings. See `:help lspconfig-setup`
    on_attach = lsp_status.on_attach,
    capabilities = lsp_status.capabilities,
    settings = {
      ["rust-analyzer"] = {
        lens = { enable = true },
        cargo = {
          allFeatures = true,
          loadOutDirsFromCheck = true,
          runBuildScripts = true
        },
        -- Add clippy lints for Rust.
        check = {
          enable = true,
          allFeatures = true,
          command = "clippy",
          extraArgs = { "--no-deps" }
        },
        procMacro = {
          enable = true,
          ignored = {
            ["async-trait"] = { "async_trait" },
            ["napi-derive"] = { "napi" },
            ["async-recursion"] = { "async_recursion" }
          }
        }
      }
    }
  }
}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- -- Use LspAttach autocommand to only map the following keys
-- -- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
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
    vim.keymap.set('n', '<space>f',
      function() vim.lsp.buf.format { async = true } end, {})
  end
})

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
