return {
  {
    "numToStr/Comment.nvim",
    name = "Comment",
    config = function() require "doty.plugins.comment" end
  }, {
  "folke/todo-comments.nvim", -- highlight comments
  name = "todo-comments",
  opts = function() return require("doty.plugins.todo-comments") end
}
}
