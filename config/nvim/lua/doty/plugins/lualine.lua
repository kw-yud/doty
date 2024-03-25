local nonIcons = require("nvim-nonicons")
local cfg = require("doty.config")
local icons = cfg.icons
local git_blame = require('gitblame')
local ayu_theme = require("lualine.themes.ayu_mirage")

vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text

-- Change the background of lualine_c section for normal mode
ayu_theme.normal.c.bg = '#0f1419'

return {
    options = {
        icons_enabled = true,
        theme = ayu_theme,
        component_separators = {left = '', right = ''},
        section_separators = {left = '', right = ''},
        always_divide_middle = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000
        }
    },
    sections = {
        lualine_a = {
            {
                "mode",
                color = {gui = 'italic,bold'},
                fmt = function(str)
                    if icons.vim_mode[str] ~= nil then
                        return "" .. icons.vim_mode[str]
                    end

                    return str:sub(1, 1)
                end
            }
        },
        lualine_b = {{"branch", icon = icons.git.branch}, 'diff', 'diagnostics'},
        lualine_c = {
            {
                git_blame.get_current_blame_text,
                cond = git_blame.is_blame_text_available
            },
            'data',
            function()
                local status = require'lsp-status'.status()
                if status == nil then return "" end

                return status
            end
        },
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    extensions = {
      'lazy',
      'man',
      'mason',
      'nvim-tree',
      'quickfix',
      'trouble'
    }
}
