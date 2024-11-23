local icons = require("nvim-nonicons")
local actions = require('telescope.actions')
local telescope = require("telescope")

telescope.setup({
  defaults = {
    prompt_prefix = "  " .. icons.get("telescope") .. "  ",
    selection_caret = " ❯ ",
    entry_prefix = "   ",
    path_display = { 'smart' },
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key",
        ["<C-k>"] = actions.preview_scrolling_up,
        ["<C-j>"] = actions.preview_scrolling_down,
        ["<esc>"] = actions.close
      }
    }
  },
  layout_config = { horizontal = { preview_cutoff = 100, preview_width = 0.6 } }
})
telescope.load_extension("notify")
telescope.load_extension("lazygit")
telescope.load_extension("dap")
