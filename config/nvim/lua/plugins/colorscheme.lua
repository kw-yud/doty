return {
  -- the colorscheme should be available when starting Neovim
  {
    "folke/tokyonight.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("doty.plugins.tokyonight")
    end,
  },
  {
    "Shatur/neovim-ayu",
    main = "ayu",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    dependencies = {
      "folke/tokyonight.nvim",
    },
    config = function()
      require("doty.plugins.ayu")
    end,
  },
  {
    -- making cool neovim color schemes
    "tjdevries/colorbuddy.nvim",
    main = "colorbuddy",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    dependencies = {
      "Shatur/neovim-ayu",
    },
    config = function()
      require("doty.plugins.colorbuddy")
    end,
  },
  {
    -- automatically highlighting other uses of the word under the cursor
    "RRethy/vim-illuminate",
    main = "illuminate",
    event = "UIEnter",
    config = function()
      return require("doty.plugins.vim-illuminate")
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    main = "colorizer",
    config = function()
      require("doty.plugins.nvim-colorizer")
    end,
  },
  {
    "norcalli/nvim-terminal.lua",
    main = "terminal",
  },

  {
    -- Adds file type icons to Vim plugins
    "nvim-tree/nvim-web-devicons",
    -- if some code requires a module from an unloaded plugin, it will be automatically loaded.
    -- So for api plugins like devicons, we can always set lazy=true
    lazy = true,
    opts = function()
      return require("doty.plugins.nvim-web-devicons")
    end,
  },
  -- TODO: Conditionally only do this for linux
  {
    "yamatsum/nvim-nonicons",
    lazy = true,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "echasnovski/mini.nvim",
    version = "*",
    lazy = true,
  },
}
