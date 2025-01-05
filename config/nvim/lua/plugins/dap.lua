return {
  {
    "nvim-telescope/telescope-dap.nvim",
    lazy = true,
    dependencies = {
      "mfussenegger/nvim-dap",
    },
  },
  {
    "mfussenegger/nvim-dap",
    main = "dap",
    lazy = true,
  },
  {
    "rcarriga/nvim-dap-ui",
    main = "dapui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-treesitter/nvim-treesitter",
    },
  },

  --  Adaparter configuration for specific languages
  -- "leoluz/nvim-dap-go",
  -- "mfussenegger/nvim-dap-python",
  -- "jbyuki/one-small-step-for-vimkind"
}
