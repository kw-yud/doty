return {
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
