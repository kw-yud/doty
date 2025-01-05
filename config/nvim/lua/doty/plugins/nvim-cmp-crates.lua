require("crates").setup({
  completion = {
    insert_closing_quote = true,
    cmp = {
      enabled = true,
    },
    crates = {
      enabled = true,
      min_chars = 3,
      max_results = 8,
    },
    lsp = {
      enabled = true,
    },
  },
})
