-- Set colorscheme after options
require("colorbuddy").colorscheme "tokyonight-night"
require("colorizer").setup({
    '*', -- Highlight all files, but customize some others.
    'conf',
    html = {css = true},
    scss = {css = true},
    css = {css = true},
    javascript = {no_names = true}
}, {
    RGB = true, -- #RGB hex codes
    RRGGBB = true, -- #RRGGBB hex codes
    names = true, -- "Name" codes like Blue
    RRGGBBAA = true, -- #RRGGBBAA hex codes
    -- Available modes: foreground, background
    mode = 'background' -- Set the display mode.
})

-- if os.getenv("TERM") =~ '^\(rxvt\|screen\|interix\|putty\)\(-.*\)\?$'
--     set notermguicolors
-- elseif os.getenv("TERM") =~ '^\(tmux\|iterm\|vte\|gnome\)\(-.*\)\?$'
--     set termguicolors
-- elseif os.getenv("TERM") =~ '^\(xterm\)\(-.*\)\?$'
--     if $XTERM_VERSION != ''
--         set termguicolors
--     elseif $KONSOLE_PROFILE_NAME != ''
--         set termguicolors
--     elseif $VTE_VERSION != ''
--         set termguicolors
--     else
--         set notermguicolors
--     endif
-- elseif os.getenv("TERM") =~ ...
--     ... and so forth ...
-- endif

-- vim.cmd('set termguicolors')
-- vim.cmd('set ft=conf')
-- vim.api.nvim_command("BufReadPost *.conf setl ft=conf")

