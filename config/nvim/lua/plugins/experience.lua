return {
  "L3MON4D3/LuaSnip", -- auto generate code
  {
    "mg979/vim-visual-multi",
    branch = "master",
    init = function()
      vim.g.VM_maps = {
        ["Find Under"] = "<C-d>"
      }
    end,
  }
}
