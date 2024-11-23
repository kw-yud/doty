return {
  {
    "hrsh7th/nvim-cmp",
    name = "cmp",
    config = function()
      require("doty.plugins.cmp")
      require("doty.plugins.cmp_gh")
    end
  }, { "hrsh7th/cmp-buffer" }, { "hrsh7th/cmp-path" }, { "hrsh7th/cmp-nvim-lua" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "saadparwaiz1/cmp_luasnip", dependencies = { "L3MON4D3/LuaSnip" } },
  { "tamago324/cmp-zsh" }
  -- {"onsails/lspkind-nvim"},
  -- AI based
  -- { "codota/tabnine-nvim", build = "/Users/koinworks/.local/share/nvim/lazy/tabnine-nvim/dl_binaries.sh" },
}
