-- Quick config: toggle features and set colorscheme here

vim.cmd.colorscheme("techbase")

local enable = {
    hardtime = true,
    showkeys  = false,
}

if enable.hardtime then require("hardtime").enable() end
if enable.showkeys  then vim.cmd("ShowkeysToggle")    end
