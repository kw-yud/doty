local lsp_zero = require('lsp-zero')
local lsp_status = require("lsp-status")
local navbuddy = require("nvim-navbuddy")
-- Setup language servers.
local lspconfig = require("lspconfig")

-- lspconfig.util.default_config()
-- lspconfig.util.ensure_installed()
-- lspconfig.util.ensure_attached()

require('mason-lspconfig').setup {
  -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
  -- This setting has no relation with the `automatic_installation` setting.
  ---@type string[]
  ensure_installed = {
    "bashls",                                                -- Bash
    "bufls",                                                 -- Buf
    "diagnosticls",                                          -- Diagnostic (general purpose server)
    -- Docker
    "dockerls", "docker_compose_language_service",           -- End
    -- Dot files
    "dotls",                                                 -- End
    -- Go -----
    "golangci_lint_ls", "gopls",                             -- End
    "jsonls",                                                -- JSON
    "lua_ls",                                                -- Lua
    -- Markdown -----
    "marksman", "prosemd_lsp", "remark_ls", "vale_ls", "zk", -- End
    "spectral",                                              -- OpenAPI
    "rust_analyzer",                                         -- Rust
    -- SQL
    "sqlls", "sqls",                                         -- End
    "yamlls"                                                 -- YAML
  },

  -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
  -- This setting has no relation with the `ensure_installed` setting.
  -- Can either be:
  --   - false: Servers are not automatically installed.
  --   - true: All servers set up via lspconfig are automatically installed.
  --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
  --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
  ---@type boolean
  automatic_installation = true,
  handlers = {
    lsp_zero.default_setup,
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim", "custom_nvim" } },
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
        "*.tfvars", "*.hcl",
        "*.config")
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
      settings = {
        ['helm-ls'] = { yamlls = { path = "yaml-language-server" } }
      }
    }, -- setup yamlls
    lspconfig.yamlls.setup {},
    -- lspconfig.pyls_ms.setup {
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
}
