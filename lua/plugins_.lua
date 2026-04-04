local s = require("settings")

-- Treesitter
vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
})
require("nvim-treesitter").setup()
require("nvim-treesitter").install(s.parsers)
require("nvim-treesitter-textobjects").setup({
    select = {
        lookahead = true,
        include_surrounding_whitespace = true,
        selection_modes = {
            ["@parameter.outer"] = "v",
            ["@function.outer"]  = "V",
            ["@class.outer"]     = "<c-v>",
        },
    },
})

-- Conform
vim.pack.add({ { src = "https://github.com/stevearc/conform.nvim" } })
require("conform").setup({ formatters_by_ft = s.formatters })

-- Snippets + Completion
vim.pack.add({
    { src = "https://github.com/L3MON4D3/LuaSnip" },
    { src = "https://github.com/rafamadriz/friendly-snippets" },
    { src = "https://github.com/hrsh7th/nvim-cmp" },
    { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
    { src = "https://github.com/hrsh7th/cmp-buffer" },
    { src = "https://github.com/hrsh7th/cmp-path" },
    { src = "https://github.com/saadparwaiz1/cmp_luasnip" },
})

local luasnip = require("luasnip")
local cmp     = require("cmp")

require("luasnip.loaders.from_vscode").lazy_load()
require("snippets.templ")

cmp.setup({
    snippet = {
        expand = function(args) luasnip.lsp_expand(args.body) end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"]     = cmp.mapping.scroll_docs(-4),
        ["<C-f>"]     = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"]     = cmp.mapping.abort(),
        ["<CR>"]      = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip"  },
    }, {
        { name = "buffer" },
        { name = "path"   },
    }),
    window = {
        documentation = {
            border     = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            max_width  = 80,
            max_height = 25,
        },
    },
})

-- FZF
vim.pack.add({
    { src = "https://github.com/echasnovski/mini.icons" },
    { src = "https://github.com/ibhagwan/fzf-lua" },
})
require("mini.icons").setup()
require("fzf-lua").setup()

-- Todo Comments
vim.pack.add({
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/folke/todo-comments.nvim" },
})
require("todo-comments").setup({
    keywords = {
        TODO = { icon = " ",  color = "info" },
        FIX  = { icon = " ",  color = "error",   alt = { "FIXME", "BUG" } },
        HACK = { icon = " ",  color = "warning" },
        NOTE = { icon = "󰍨 ", color = "hint" },
        PERF = { icon = "󰅒 ", color = "warning", alt = { "OPTIMIZE" } },
    },
    highlight = { multiline = false },
    search = {
        command = "rg",
        args    = { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column" },
        pattern = [[\b(KEYWORDS):]],
    },
})

-- Flash
vim.pack.add({ { src = "https://github.com/folke/flash.nvim" } })
require("flash").setup()


-- Copilot (ghost text only, no panel, no cmp source)
vim.pack.add({ { src = "https://github.com/zbirenbaum/copilot.lua" } })
require("copilot").setup({
    suggestion = {
        enabled      = s.enable.copilot,
        auto_trigger = s.enable.copilot,
        keymap       = { accept = false, next = false, prev = false, dismiss = false },
    },
    panel     = { enabled = false },
    filetypes = { markdown = true, help = true },
})

-- Opencode
vim.pack.add({ { src = "https://github.com/sudo-tee/opencode.nvim" } })
require("opencode").setup()

-- Claude Code
vim.pack.add({ { src = "https://github.com/coder/claudecode.nvim" } })
require("claudecode").setup()
