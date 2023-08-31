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
package.path = semverpath .. '/semver.lua;' .. package.path
local v = require "semver"

local required_programs = {
    go = "Some Go related features might not work",
    cargo = "Some Rust related features might not work",
    python3 = "Some Python related features might not work",
    node = "Mason will not be able to install some LSPs/tools",
    tectonic = "Latex build command will not work",
    rg = "a highly recommended grep alternative (ripgrep is the package name)",
    fd = "a highly recommended find alternative"
}

local start = vim.health.start or vim.health.report_start
local ok = vim.health.ok or vim.health.report_ok
local warn = vim.health.warn or vim.health.report_warn
local error = vim.health.error or vim.health.report_error
local info = vim.health.info or vim.health.report_info

local M = {}

--- Check if the minimum Neovim version is supported.
---@param version number
---@return boolean
local function isNeovimVersionSupported(version)
    return v(string.format("%d.%d.%d", vim.version().major, vim.version().minor,
                           vim.version().patch)) >= v(version)
end

function M.check()
    start("Doty")

    -- make sure setup function parameters are ok
    for command, msg in pairs(required_programs) do
        if vim.fn.executable(command) == 1 then
            ok(string.format("%s: binary found", command))
        else
            warn(
                string.format("%s: binary not found in PATH - %s", command, msg))
        end
    end

    -- do some more checking
    if not isNeovimVersionSupported('0.9') then
        error("This config probably won't work very well with Neovim < 0.9")
    end
end

return M
