-- Install semver.lua module
local semverpath = vim.fn.stdpath("data") ..
                       "/site/pack/kikito/start/semver.lua/lua"
if not vim.loop.fs_stat(semverpath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/kikito/semver.lua.git", "--branch=master", -- latest stable release
        semverpath
    })
end
vim.opt.rtp:prepend(semverpath)

-- Setup options that I expect to be always available.
--  See `./config/*.lua` for more information  .
local config_modules = { --
    "doty.options", -- Setup nvim option
    "doty.lazy", -- Plugin management via lazy
    "doty.keymaps" -- load mappings only after editor configs are loaded
}

-- set up nvim
for _, mod in ipairs(config_modules) do
    local ok, err = pcall(require, mod)
    -- cosmic.config files may or may not be present
    if not ok and not mod:find('config') then
        error(('Error loading %s...\n\n%s'):format(mod, err))
    end
end
