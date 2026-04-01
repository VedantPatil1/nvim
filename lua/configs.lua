-- ~/.config/nvim-new/lua/configs.lua
local opt = vim.opt

-- Native Config

-- Line numbers
opt.number = true
opt.relativenumber = false

-- Tabs and indentation (fallback default)
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

-- UI stuff
opt.termguicolors = true
opt.signcolumn = "yes"

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true

-- Scrolling
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Mouse
opt.mouse = "a"

-- Clipboard (optional: use system clipboard)
opt.clipboard = "unnamedplus"

-- Split behavior
opt.splitbelow = true
opt.splitright = true

-- Undo
opt.undofile = true

-- Completion

opt.autocomplete = true
opt.autocompletedelay = 100   -- Delay in ms before showing (tweak for feel)
opt.autocompletetimeout = 500

vim.opt.complete = { ".", "w", "b", "u" }
vim.opt.completeopt = { "menu", "menuone", "noselect", "popup" }

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, args.data.client_id, args.buf, { autotrigger = true })
    end
  end,
})
-- Filetype

vim.cmd.filetype("plugin indent on") -- Enable filetype detection, plugins, and indentation

vim.filetype.add({ extension = { templ = "templ" } })

-- FT indent

local indent_settings = {
  lua        = { shiftwidth = 2, tabstop = 2, softtabstop = 2, expandtab = true },
  python     = { shiftwidth = 4, tabstop = 4, softtabstop = 4, expandtab = true },
  go         = { shiftwidth = 8, tabstop = 8, softtabstop = 0, expandtab = false }, -- Go uses tabs by convention
  javascript = { shiftwidth = 2, tabstop = 2, softtabstop = 2, expandtab = true },
  html       = { shiftwidth = 2, tabstop = 2, softtabstop = 2, expandtab = true },
  gohtml     = { shiftwidth = 2, tabstop = 2, softtabstop = 2, expandtab = true },
  css        = { shiftwidth = 2, tabstop = 2, softtabstop = 2, expandtab = true },
  make       = { shiftwidth = 8, tabstop = 8, softtabstop = 0, expandtab = false }, -- Use tabs in Makefiles
  json       = { shiftwidth = 2, tabstop = 2, softtabstop = 2, expandtab = true },
  yaml       = { shiftwidth = 2, tabstop = 2, softtabstop = 2, expandtab = true },
  terraform  = { shiftwidth = 2, tabstop = 2, softtabstop = 2, expandtab = true },
}

for ft, opts in pairs(indent_settings) do
  vim.api.nvim_create_autocmd("FileType", {
    pattern = ft,
    callback = function()
      vim.opt_local.shiftwidth = opts.shiftwidth
      vim.opt_local.tabstop = opts.tabstop
      vim.opt_local.softtabstop = opts.softtabstop
      vim.opt_local.expandtab = opts.expandtab
    end,
  })
end
