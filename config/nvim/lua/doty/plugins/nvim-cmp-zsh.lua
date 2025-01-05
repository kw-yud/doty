require("cmp_zsh").setup({
  zshrc = true, -- Source the zshrc (adding all custom completions). default: false
  filetypes = {
    "deoledit",
    "bash",
    "sh",
    "zsh",
  }, -- Filetypes to enable cmp_zsh source. default: {"*"}
})
