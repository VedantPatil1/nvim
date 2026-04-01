local opt = vim.opt

-- Line numbers
opt.number         = true
opt.relativenumber = false

-- Tabs and indentation (fallback default)
opt.tabstop     = 4
opt.shiftwidth  = 4
opt.softtabstop = 4
opt.expandtab   = true

-- UI
opt.termguicolors = true
opt.signcolumn    = "yes"
opt.updatetime    = 500

-- Search
opt.ignorecase = true
opt.smartcase  = true
opt.incsearch  = true
opt.hlsearch   = true

-- Scrolling
opt.scrolloff     = 8
opt.sidescrolloff = 8

-- Mouse
opt.mouse = "a"

-- Clipboard
opt.clipboard = "unnamedplus"

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Undo
opt.undofile  = true
opt.swapfile  = false

-- Completion
opt.autocomplete        = true
opt.autocompletedelay   = 100
opt.autocompletetimeout = 500
opt.complete    = { ".", "w", "b", "u" }
opt.completeopt = { "menu", "menuone", "noselect", "popup" }

-- Filetypes
vim.cmd.filetype("plugin indent on")
vim.filetype.add({ extension = { templ = "templ" } })

-- LSP: enable servers (configs loaded from lsp/<name>.lua automatically)
vim.lsp.enable(require("settings").lsp)

-- Diagnostics
vim.diagnostic.config({
    severity_sort = true,
    virtual_text  = true,
    underline     = { severity = vim.diagnostic.severity.ERROR },
})
