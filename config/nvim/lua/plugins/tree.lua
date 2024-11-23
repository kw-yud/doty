return {
  {
    "nvim-tree/nvim-tree.lua",
    name = "nvim-tree",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function() require("doty.plugins.nvim-tree") end
  } -- {
  --     -- A simple file explorer
  --     "tamago324/lir.nvim",
  --     name = "lir"
  -- }, {"tamago324/lir-git-status.nvim"}, {
  --     -- Git status integration of lir.nvim
  --     "tamago324/lir-mmv.nvim",
  --     name = "lir.git_status",
  --     cond = function() return vim.fn.executable "mmv" == 1 end
  -- },
}
