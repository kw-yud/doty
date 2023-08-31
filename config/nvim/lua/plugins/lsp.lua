return {
    {
        "folke/neodev.nvim",
        name = "neodev",
        dependencies = {"rcarriga/nvim-dap-ui"},
        opts = function() return require("doty.plugins.neodev") end
    }, {
        --
        "williamboman/mason.nvim",
        name = "mason",
        config = function() require("doty.plugins.mason") end
    }, {
        --
        "williamboman/mason-lspconfig.nvim",
        name = "mason-lspconfig",
        dependencies = {"williamboman/mason.nvim"},
        opts = function() return require("doty.plugins.mason-lspconfig") end
    }, -- {
    --     "WhoIsSethDaniel/mason-tool-installer.nvim",
    --     config = function()
    --         require("mason-tool-installer").setup {
    --             auto_update = true,
    --             debounce_hours = 24,
    --             ensure_installed = {}
    --         }
    --     end
    -- },
    {
        "nvim-lua/lsp-status.nvim",
        name="lsp-status",
        config = function() require("doty.plugins.lsp-status") end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "SmiteshP/nvim-navbuddy",
            "williamboman/mason-lspconfig.nvim",
            "nvim-lua/lsp-status.nvim",
        },
        config = function() require("doty.plugins.nvim-lspconfig") end
    },
}
