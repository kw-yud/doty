return {
    -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
    -- This setting has no relation with the `automatic_installation` setting.
    ---@type string[]
    ensure_installed = {
        "bashls", -- Bash
        "bufls", -- Buf
        "diagnosticls", -- Diagnostic (general purpose server)
        -- Docker
        "dockerls", "docker_compose_language_service", -- End
        -- Dot files
        "dotls", -- End
        -- Go -----
        "golangci_lint_ls", "gopls", -- End
        "jsonls", -- JSON
        "lua_ls", -- Lua
        -- Markdown -----
        "marksman", "prosemd_lsp", "remark_ls", "vale_ls", "zk", -- End
        "spectral", -- OpenAPI
        "rust_analyzer", -- Rust
        -- SQL
        "sqlls", "sqls", -- End
        "yamlls" -- YAML
    },

    -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
    -- This setting has no relation with the `ensure_installed` setting.
    -- Can either be:
    --   - false: Servers are not automatically installed.
    --   - true: All servers set up via lspconfig are automatically installed.
    --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
    --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
    ---@type boolean
    automatic_installation = true
}
