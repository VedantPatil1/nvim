vim.filetype.add({ extension = { templ = "templ" } })

vim.g.mapleader = " "

-- lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
require("config.keymaps")

vim.cmd("colorscheme kanagawa")

-- Configs not dependent on Plugins.
-- Can be replicated in bear vim.
require("user.autocommand")
require("user.editor")
require("user.indent")
require("user.keybindings")

-- Only runs if neovide is run
if vim.g.neovide then
  require("neovide")
end
