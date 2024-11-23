return {
  {
    "folke/twilight.nvim",
    name = "twilight",
    opts = function() return require("doty.plugins.twilight") end
  },
  {
    "folke/zen-mode.nvim",
    name = "zen-mode",
    dependencies = { "folke/twilight.nvim" },
    opts = function() return require("doty.plugins.zen-mode") end
  }
}
