vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Add this line at the top of your Lua config file
_G.vim = vim

vim.opt.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
require("keymaps")
require("options")
require("luatheme")
require("alphatheme")
