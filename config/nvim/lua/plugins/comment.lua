return {
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    enabled = true,
  },
  {
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      require("doty.plugins.comment")
    end,
  },
  {
    "folke/todo-comments.nvim", -- highlight comments
    opts = function()
      return require("doty.plugins.todo-comments")
    end,
  },
}
