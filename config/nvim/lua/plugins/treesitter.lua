return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("doty.plugins.nvim-treesitter")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    enabled = true,
  },
  { "nvim-treesitter/nvim-treesitter-context", main = "treesitter-context" },

  {
    "bennypowers/nvim-regexplainer",
    main = "regexplainer",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "mfussenegger/nvim-ts-hint-textobject",
    config = function()
      vim.cmd([[omap     <silent> m :<C-U>lua require("tsht").nodes()<CR>]])
      vim.cmd([[vnoremap <silent> m :lua require("tsht").nodes()<CR>]])
    end,
  },
  -- { dir = "~/plugins/tree-sitter-lua" },
  -- "nvim-treesitter/playground",
  -- "vigoux/architext.nvim",
}
