return {
  {
    "nvim-telescope/telescope.nvim",
    name = "telescope",
    priority = 100,
    dependencies = {
      "nvim-lua/plenary.nvim", "rcarriga/nvim-notify",
      "kdheepak/lazygit.nvim", "nvim-telescope/telescope-dap.nvim"
    },
    config = function() require("doty.plugins.telescope") end
  }
}
