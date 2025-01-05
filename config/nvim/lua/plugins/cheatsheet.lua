return {
  {
    "folke/which-key.nvim",
    -- With lazy the plugin will be automatically loaded when it is required somewhere
    event = "VeryLazy",
    config = function()
      require("doty.plugins.which-key")
    end,
  },
}
