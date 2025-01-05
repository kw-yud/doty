return {
  { "nvim-treesitter/nvim-treesitter" },
  { "nvim-treesitter/nvim-treesitter-context", main = "treesitter-context" },

  {
    "bennypowers/nvim-regexplainer",
    main = "regexplainer",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "MunifTanjim/nui.nvim",
    },
  },
  -- { dir = "~/plugins/tree-sitter-lua" },
  -- "nvim-treesitter/playground",
  -- "nvim-treesitter/nvim-treesitter-textobjects",
  -- "JoosepAlviste/nvim-ts-context-commentstring",
  { "nvim-treesitter/nvim-treesitter-context", name = "treesitter-context" },

  {
    'bennypowers/nvim-regexplainer',
    name = "regexplainer",
    dependencies = {
      'nvim-treesitter/nvim-treesitter', 'MunifTanjim/nui.nvim'
    }
  }
  -- "vigoux/architext.nvim"
  -- {
  --     "mfussenegger/nvim-ts-hint-textobject",
  --     config = function()
  --       vim.cmd [[omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>]]
  --       vim.cmd [[vnoremap <silent> m :lua require('tsht').nodes()<CR>]]
  --     end,
  -- }
}
