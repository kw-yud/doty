return {
  {
    "hrsh7th/nvim-cmp",
    main = "cmp",
    -- load cmp on InsertEnter
    event = "InsertEnter",
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "VonHeikemen/lsp-zero.nvim",
    },
    config = function()
      require("doty.plugins.nvim-cmp")
    end,
  },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lua" },
  { "hrsh7th/cmp-path" },
  { "saadparwaiz1/cmp_luasnip", dependencies = { "L3MON4D3/LuaSnip" } },
  {
    "tamago324/cmp-zsh",
    config = function()
      require("doty.plugins.nvim-cmp-zsh")
    end,
  },
  { "L3MON4D3/LuaSnip" }, -- auto generate code
  -- {'rafamadriz/friendly-snippets'},
}
