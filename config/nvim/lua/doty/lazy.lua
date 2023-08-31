-- Install neovim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
    -- defaults = {lazy = false},
    install = {
        -- install missing plugins on startup. This doesn't increase startup time.
        missing = true,
        colorscheme = {"ayu-mirage"}
    },
    dev = {
        -- directory where you store your local plugin projects
        path = os.getenv("DOTY_DIRECTORY") .. "/config/nvim/plugins",
        -- Fallback to git when local plugin doesn't exist
        fallback = false
    },
    -- checker = { enabled = true },
    debug = true,
    -- spec = {
    --     -- import/override with your plugins configuration inside "lua/plugins" directory
    --     { import = "plugins" },
    -- },
    change_detection = {
        -- automatically check for config file changes and reload the ui
        enabled = true,
        -- get a notification when changes are found
        notify = true
    },
    performance = {
        cache = {enabled = false},
        reset_packpath = true, -- reset the package path to improve startup time
        rtp = {
            -- reset the runtime path to $VIMRUNTIME and your config directory
            reset = false
            -- add any custom paths here that you want to includes in the rtp
            ---@type string[]
            -- paths = {
            --     os.getenv("DOTY_DIRECTORY") .. "/config/nvim/after",
            --     os.getenv("DOTY_DIRECTORY") .. "/config/nvim",
            -- },
            ---@type string[] list any plugins you want to disable here
            -- disabled_plugins = {
            -- "gzip",
            -- "matchit",
            -- "matchparen",
            -- "netrwPlugin",
            -- "tarPlugin",
            -- "tohtml",
            -- "tutor",
            -- "zipPlugin",
            -- }
        }
    },
    ui = {
        border = "rounded",
        size = {width = 0.7, height = 0.7},
        icons = {
            cmd = "⌘",
            config = "🛠 ",
            event = "📅",
            ft = "📂",
            init = "⚙",
            import = " ",
            keys = "🗝 ",
            lazy = "💤 ",
            list = {"●", "➜", "★", "‒"},
            loaded = "●",
            not_loaded = "○",
            plugin = "🔌",
            runtime = "💻",
            source = "📄",
            start = "🚀",
            task = "📌"
        }
    },
    build = {
        -- Plugins can provide a `build.lua` file that will be executed when the plugin is installed
        -- or updated. When the plugin spec also has a `build` command, the plugin's `build.lua` not be
        -- executed. In this case, a warning message will be shown.
        warn_on_override = true
    }
})
