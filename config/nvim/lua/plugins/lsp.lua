return {
  {
    "folke/neodev.nvim",
    name = "neodev",
    dependencies = { "rcarriga/nvim-dap-ui" },
    opts = function() return require("doty.plugins.neodev") end
  },
  {
    "nvim-lua/lsp-status.nvim",
    name = "lsp-status",
    config = function() require("doty.plugins.lsp-status") end
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
    config = function() require("doty.plugins.lsp-zero") end
  },
  {
    --
    "williamboman/mason.nvim",
    name = "mason",
    config = function() require("doty.plugins.mason") end
  },
  {
    --
    "williamboman/mason-lspconfig.nvim",
    name = "mason-lspconfig",
    dependencies = { "williamboman/mason.nvim" },
    config = function() require("doty.plugins.mason-lspconfig") end
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "SmiteshP/nvim-navbuddy",
      "nvim-lua/lsp-status.nvim"
    },
    config = function() require("doty.plugins.nvim-lspconfig") end
  },
  -- {
  --     "WhoIsSethDaniel/mason-tool-installer.nvim",
  --     config = function()
  --         require("mason-tool-installer").setup {
  --             auto_update = true,
  --             debounce_hours = 24,
  --             ensure_installed = {}
  --         }
  --     end
  -- },
}
