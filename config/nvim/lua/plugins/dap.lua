return {
  { "mfussenegger/nvim-dap",           name = "dap" },
  {
    "nvim-telescope/telescope-dap.nvim",
    dependencies = { "mfussenegger/nvim-dap" }
  }, {
  "rcarriga/nvim-dap-ui",
  name = "dapui",
  dependencies = { "mfussenegger/nvim-dap" }
}, { "theHamsta/nvim-dap-virtual-text", name = "nvim-dap-virtual-text" },

  --  Adaparter configuration for specific languages
  -- "leoluz/nvim-dap-go",
  -- "mfussenegger/nvim-dap-python",
  -- "jbyuki/one-small-step-for-vimkind"
}
