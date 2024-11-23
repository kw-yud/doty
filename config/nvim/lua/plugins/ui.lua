return {
  {
    -- Adds file type icons to Vim plugins
    "nvim-tree/nvim-web-devicons",
    name = "nvim-web-devicons",
    opts = function()
      return require("doty.plugins.nvim-web-devicons")
    end
  }, -- TODO: Conditionally only do this for linux
  {
    'yamatsum/nvim-nonicons',
    name = "nvim-nonicons",
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  {
    'nvim-lualine/lualine.nvim',
    name = "lualine",
    dependencies = {
      "yamatsum/nvim-nonicons", "nvim-tree/nvim-web-devicons",
      "folke/tokyonight.nvim", "Shatur/neovim-ayu",
      "f-person/git-blame.nvim"
    },
    opts = function() return require("doty.plugins.lualine") end
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",         --
      "nvim-tree/nvim-web-devicons", -- optional dependency
      "folke/tokyonight.nvim"
    },
    config = function() require("doty.plugins.barbecue") end
  },
  {
    'rcarriga/nvim-notify',
    event = 'VeryLazy',
    dependencies = { 'yamatsum/nvim-nonicons' },
    opts = function() return require("doty.plugins.notify") end,
    init = function()
      -- When noice is not enabled, install notify on VeryLazy
      local fn = require('doty.utils.functions')
      if not fn.has('noice.nvim') then
        fn.on_very_lazy(function()
          vim.notify = require('notify')
        end)
      end
    end
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify',
      'nvim-treesitter/nvim-treesitter'
    },
    ---@type NoiceConfig
    -- opts = function() return require("doty.plugins.noice") end
  },
  {
    'stevearc/dressing.nvim',
    name = "dressing",
    init = function()
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.select = function(...)
        require('lazy').load({ plugins = { 'dressing.nvim' } })
        return vim.ui.select(...)
      end
      ---@diagnostic disable-next-line: duplicate-set-field
      vim.ui.input = function(...)
        require('lazy').load({ plugins = { 'dressing.nvim' } })
        return vim.ui.input(...)
      end
    end
  },
  {
    "folke/trouble.nvim",
    name = "trouble",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function() return require("doty.plugins.trouble") end
  },
  -- {
  -- Remove all background colors to make nvim transparent
  --    "xiyaowong/nvim-transparent",
  --    name = "transparent",
  --    event = 'VeryLazy',
  --    config = function() require("doty.plugins.transparent") end
  -- },
  {
    "SmiteshP/nvim-navbuddy",
    name = "nvim-navbuddy",
    dependencies = { "SmiteshP/nvim-navic", "MunifTanjim/nui.nvim", "neovim/nvim-lspconfig",
      "numToStr/Comment.nvim",        -- Optional
      "nvim-telescope/telescope.nvim" -- Optional
    },
    config = function() return require("doty.plugins.nvim-navbuddy") end
  },
  {
    "f-person/lua-timeago",
    name = "lua-timeago",
    config = function()
      local lang = require('lua-timeago/languages/en')
      require('lua-timeago').set_language(lang)
    end
  },
  {
    "j-hui/fidget.nvim",
    tag = 'legacy',
    config = function() require('doty.plugins.fidget') end
  },
  {
    'glepnir/dashboard-nvim',
    name = "dashboard",
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        theme = 'doom',           --  theme is doom and hyper default is hyper
        disable_move = false,     --  default is false disable move keymap for hyper
        shortcut_type = "number", --  shortcut type 'letter' or 'number'
        -- change_to_vcs_root, -- default is false,for open file in hyper mru. it will change to the root of vcs
        config = {}               --  config used for theme
        -- hide = {
        --     statusline, -- hide statusline default is true
        --     tabline, -- hide the tabline
        --     winbar -- hide winbar
        -- },
        -- preview = {
        --     command, -- preview command
        --     file_path, -- preview file path
        --     file_height, -- preview file height
        --     file_width -- preview file width
        -- }
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function() return require("doty.plugins.indent-blankline") end
  }
}
