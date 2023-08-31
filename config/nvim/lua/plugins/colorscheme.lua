return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function() require("doty.plugins.tokyonight") end
    }, {
        "Shatur/neovim-ayu",
        name = "ayu",
        lazy = false,
        priority = 1000,
        config = function() require("doty.plugins.ayu") end
    }, {
        -- automatically highlighting other uses of the word under the cursor
        "RRethy/vim-illuminate",
        name = "illuminate",
        config = function() return require("doty.plugins.illuminate") end
    }, {
        -- making cool neovim color schemes
        "tjdevries/colorbuddy.nvim",
        name = "colorbuddy",
        dependencies = {"folke/tokyonight.nvim"},
        config = function() require("doty.plugins.colorbuddy") end
    } --
}
