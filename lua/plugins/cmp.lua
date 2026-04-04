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

