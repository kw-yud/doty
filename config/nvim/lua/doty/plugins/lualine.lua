local nonIcons = require("nvim-nonicons")
local cfg = require("doty.config")
local icons = cfg.icons
local git_blame = require('gitblame')
local ayu_theme = require("lualine.themes.ayu_mirage")

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg = '#202328',
  fg = '#bbc2cf',
  yellow = '#ECBE7B',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#98be65',
  orange = '#FF8800',
  violet = '#a9a1e1',
  magenta = '#c678dd',
  blue = '#51afef',
  red = '#ec5f67'
}

vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text

-- Change the background of lualine_c section for normal mode
ayu_theme.normal.c.bg = '#0f1419'

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end
}

return {
  options = {
    icons_enabled = true,
    theme = ayu_theme,
    component_separators = {
      left = '',
      right = ''
    },
    section_separators = {
      left = '',
      right = ''
    },
    always_divide_middle = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000
    }
  },
  sections = {
    lualine_a = { {
      "mode",
      color = function()
        -- auto change color according to neovims mode
        local mode_color = {
          n = colors.darkblue,
          i = colors.green,
          v = colors.blue,
          [''] = colors.blue,
          V = colors.blue,
          c = colors.magenta,
          no = colors.red,
          s = colors.orange,
          S = colors.orange,
          [''] = colors.orange,
          ic = colors.yellow,
          R = colors.violet,
          Rv = colors.violet,
          cv = colors.red,
          ce = colors.red,
          r = colors.cyan,
          rm = colors.cyan,
          ['r?'] = colors.cyan,
          ['!'] = colors.red,
          t = colors.red
        }
        return {
          gui = 'italic,bold',
          fg = mode_color[vim.fn.mode()]
        }
      end,
      fmt = function(str)
        if icons.vim_mode[str] ~= nil then
          return "" .. icons.vim_mode[str]
        end

        return str:sub(1, 1)
      end
    } },
    lualine_b = { {
      "branch",
      icon = icons.git.branch
    }, {
      'diff',
      -- Is it me or the symbol for modified us really weird
      symbols = {
        added = icons.git.diff.add .. ' ',
        modified = icons.git.diff.change .. ' ',
        removed = icons.git.diff.delete .. ' '
      },
      diff_color = {
        added = {
          fg = cfg.colors.fg.diff.add
        },
        modified = {
          fg = cfg.colors.fg.diff.change
        },
        removed = {
          fg = cfg.colors.fg.diff.delete
        }
      },
      cond = conditions.hide_in_width
    }, {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      symbols = {
        error = icons.error .. ' ',
        warn = icons.warning .. ' ',
        info = icons.info .. ' '
      },
      diagnostics_color = {
        color_error = {
          fg = cfg.colors.fg.error
        },
        color_warn = {
          fg = cfg.colors.fg.warning
        },
        color_info = {
          fg = cfg.colors.fg.info
        }
      }
    } },
    lualine_c = { {
      git_blame.get_current_blame_text,
      cond = git_blame.is_blame_text_available
    }, 'data' },
    lualine_x = { {
      -- Lsp server name .
      function()
        local status = require 'lsp-status'.status()
        if status ~= nil then
          return status
        end

        local msg = 'No Lsp'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
          return icons.lsp .. ' ' .. msg
        end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return icons.lsp .. ' ' .. client.name
          end
        end

        return icons.lsp .. ' ' .. msg
      end,
      icon = icons.lsp,
      color = {
        fg = cfg.colors.fg.hint,
        gui = 'bold'
      }
    } },
    lualine_y = { {
      'encoding',
      cond = conditions.hide_in_width
    }, 'fileformat', 'filetype' },
    lualine_z = { 'progress', 'location' }
  },
  extensions = { 'lazy', 'man', 'mason', 'nvim-tree', 'quickfix', 'trouble' }
}
