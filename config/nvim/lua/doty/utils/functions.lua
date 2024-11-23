local cmd = vim.cmd
local fn = vim.fn

local M = {}

---checks if a command is available.
---@param command string
---@return boolean
function M.isExecutableAvailable(command) return vim.fn.executable(command) == 1 end

--- Check if the minimum given version is supported.
---@param check string
---@param expected string
---@return boolean
function M.isVersionSupported(check, expected)
  -- TODO: not sure if we move this to first line, circular require occurred
  local v = require "semver"

  return v(check) >= v(expected)
end

--- Check if the minimum Neovim version is supported.
---@param version number
---@return boolean
function M.isNeovimVersionSupported(version)
  return M.isVersionSupported(string.format("%d.%d.%d", vim.version().major,
    vim.version().minor,
    vim.version().patch), version)
end

function M.notify(message, level, title)
  local notify_options = {
    title = title
    -- timeout = 1000,
  }
  vim.api.nvim_notify(message, level, notify_options)
end

function M.merge(...) return vim.tbl_deep_extend('force', ...) end

function M.keymap(mode, lhs, rhs, opts)
  local defaults = { silent = true, noremap = false }
  vim.keymap.set(mode, lhs, rhs, M.merge(defaults, opts or {}))
end

-- Normal mode keybinding setter
function M.nmap(lhs, rhs, opts) M.keymap("n", lhs, rhs, opts) end

-- Input mode keybinding setter
function M.imap(lhs, rhs, opts) M.keymap("i", lhs, rhs, opts) end

-- Visual mode keybinding setter
function M.vmap(lhs, rhs, opts) M.keymap("v", lhs, rhs, opts) end

-- Terminal mode keybinding setter
function M.tmap(lhs, rhs, opts) M.keymap("t", lhs, rhs, opts) end

---@param plugin string
---@return boolean
function M.has(plugin)
  -- return require('lazy.core.config').plugins[plugin] ~= nil
  return require('lazy.core.config').spec.plugins[plugin] ~= nil
end

---@param fn fun()
function M.on_very_lazy(fn)
  vim.api.nvim_create_autocmd('User', {
    pattern = 'VeryLazy',
    callback = function() fn() end
  })
end

function M.autocmd(args)
  local event = args[1]
  local group = args[2]
  local callback = args[3]

  vim.api.nvim_create_autocmd(event, {
    group = group,
    buffer = args[4],
    callback = function() callback() end,
    once = args.once
  })
end

return M
