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
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "onsails/lspkind-nvim",
      "petertriho/cmp-git",
      "ray-x/cmp-treesitter",
      "saadparwaiz1/cmp_luasnip",
      "saecki/crates.nvim",
      "tamago324/cmp-zsh",
      "VonHeikemen/lsp-zero.nvim",
    },
    config = function()
      require("doty.plugins.nvim-cmp")
    end,
  },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-calc" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/cmp-emoji" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lua" },
  { "hrsh7th/cmp-path" },
  {
    "onsails/lspkind-nvim",
    main = "lspkind",
    config = function()
      require("doty.plugins.lspkind-nvim")
    end,
  },
  {
    "petertriho/cmp-git",
    config = function()
      require("doty.plugins.nvim-cmp-git")
    end,
  },
  { "ray-x/cmp-treesitter" },
  { "saadparwaiz1/cmp_luasnip", dependencies = { "L3MON4D3/LuaSnip" } },
  {
    "saecki/crates.nvim",
    event = {
      "BufRead Cargo.toml",
    },
    config = function()
      require("doty.plugins.nvim-cmp-crates")
    end,
  },
  {
    "tamago324/cmp-zsh",
    config = function()
      require("doty.plugins.nvim-cmp-zsh")
    end,
  },
  { "L3MON4D3/LuaSnip" }, -- auto generate code
  -- {'rafamadriz/friendly-snippets'},
}
