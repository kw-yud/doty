return {
  {
    -- Git
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",  -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
      -- "ibhagwan/fzf-lua",              -- optional
    },
    config = function()
      require("doty.plugins.neogit")
    end,
  },
  {
    -- Super fast git decorations implemented purely in Lua
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    dependencies = {
      "tjdevries/colorbuddy.nvim",
      "folke/trouble.nvim",
    },
    config = function()
      require("doty.plugins.git-signs")
    end,
  },
  {
    "rhysd/git-messenger.vim",
    event = "VeryLazy",
    config = function()
      require("doty.plugins.git-messenger")
    end,
  },
  "rhysd/committia.vim", -- Sweet commit messages
  {
    -- Sweet diff helper
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    config = function()
      require("doty.plugins.git-diffview")
    end,
  },
  {
    -- Git blamme
    "f-person/git-blame.nvim",
    main = "gitblame",
    lazy = true,
    dependencies = {
      "f-person/lua-timeago",
    },
    config = function()
      require("doty.plugins.git-blame")
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
