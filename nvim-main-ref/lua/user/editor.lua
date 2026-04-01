-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = false

-- Tabs and indentation (fallback default)
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- UI stuff
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Scrolling
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Mouse
vim.opt.mouse = "a"

-- Clipboard (optional: use system clipboard)
vim.opt.clipboard = "unnamedplus"

-- Split behavior
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Undo
vim.opt.undofile = true

-- Completion settings (nvim-cmp will handle this)
vim.opt.completeopt = { "menu", "menuone", "noselect" }

