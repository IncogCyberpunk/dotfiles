require 'config.options'
require 'config.keymaps'
require 'config.misc'
require 'config.autocommands'
require 'lsp.lsp-conf'

-- set up the lazy plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
-- Checks if the lazy.nvim file exists at the directory given by lazypath
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
-- Puts the lazy into runtimepath for neovim
vim.opt.runtimepath:prepend(lazypath)

-- NOTE: This way of modularizing plugins is provided by the lazy.nvim plugin manager , where lazy.nvim first checks if plugins.lua exists else if it's a directory then it auto. loads all .lua files in lua/plugin/
require('lazy').setup 'plugins'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
