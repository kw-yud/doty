local M = {}

---checks if a command is available.
---@param command string
---@return boolean
function M.isExecutableAvailable(command)
  return vim.fn.executable(command) == 1
end

--- Check if the minimum given version is supported.
---@param check string
---@param expected string
---@return boolean
function M.isVersionSupported(check, expected)
  -- TODO: not sure if we move this to first line, circular require occurred
  local v = require("semver")

  return v(check) >= v(expected)
end

--- Check if the minimum Neovim version is supported.
---@param version string
---@return boolean
function M.isNeovimVersionSupported(version)
  return M.isVersionSupported(
    string.format(
      "%d.%d.%d",
      vim.version().major,
      vim.version().minor,
      vim.version().patch
    ),
    version
  )
end

function M.notify(message, level, title)
  local notify_options = {
    title = title,
    -- timeout = 1000,
  }
  vim.api.nvim_notify(message, level, notify_options)
end

function M.merge(...)
  return vim.tbl_deep_extend("force", ...)
end

function M.keymap(mode, keys, func, opts)
  local defaults = { silent = true, noremap = false }
  vim.keymap.set(mode, keys, func, M.merge(defaults, opts or {}))
end

-- Normal mode keybinding setter
function M.nmap(keys, func, opts)
  M.keymap("n", keys, func, opts)
end

-- Input mode keybinding setter
function M.imap(keys, func, opts)
  M.keymap("i", keys, func, opts)
end

-- Visual mode keybinding setter
function M.vmap(keys, func, opts)
  M.keymap("v", keys, func, opts)
end

-- Terminal mode keybinding setter
function M.tmap(keys, func, opts)
  M.keymap("t", keys, func, opts)
end

---@param plugin string
---@return boolean
function M.has(plugin)
  -- return require('lazy.core.config').plugins[plugin] ~= nil
  return require("lazy.core.config").spec.plugins[plugin] ~= nil
end

---@param fn fun()
function M.on_very_lazy(fn)
  vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
      fn()
    end,
  })
end

function M.autocmd(args)
  local event = args[1]
  local group = args[2]
  local callback = args[3]

  vim.api.nvim_create_autocmd(event, {
    group = group,
    buffer = args[4],
    callback = function()
      callback()
    end,
    once = args.once,
  })
end

function M.compose_fns(...)
  local funcs = { ... }
  return function(...)
    for _, fn in pairs(funcs) do
      if vim.is_callable(fn) and type(fn) == "function" then
        fn(...)
      end
    end
  end
end

return M
