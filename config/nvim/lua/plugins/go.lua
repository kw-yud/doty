return {
    "tjdevries/green_light.nvim", -- go test in nvim
    "buoto/gotests-vim", -- generate test suite
    {
        "ray-x/go.nvim",
        name = "go",
        event = {"CmdlineEnter"},
        ft = {"go", 'gomod'},
        build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
        dependencies = { -- optional packages
            "ray-x/guihua.lua", "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter"
        },
        config = function() require("doty.plugins.go") end
    }, "fatih/vim-go"
}
