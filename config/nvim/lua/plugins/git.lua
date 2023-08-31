return {
    {
        -- Git
        "TimUntersberger/neogit",
        name = "neogit",
        dependencies = 'nvim-lua/plenary.nvim',
        config = function() require("doty.plugins.neogit") end
    }, {
        -- Super fast git decorations implemented purely in Lua
        "lewis6991/gitsigns.nvim",
        name = "gitsigns",
        dependencies = {"folke/trouble.nvim"},
        config = function() require("doty.plugins.gitsigns") end
    }, "rhysd/git-messenger.vim", "rhysd/committia.vim", -- Sweet commit messages
    {
        -- Sweet diff helper
        "sindrets/diffview.nvim",
        name = "diffview",
        config = function() require("doty.plugins.diffview") end
    }, -- "Rawnly/gist.nvim", -- Gist helper
    {
        -- Git blamme
        "f-person/git-blame.nvim",
        name = "gitblame",
        dependencies = {"f-person/lua-timeago"}
    }, {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {"nvim-lua/plenary.nvim"}
    }
}
