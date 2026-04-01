-- which-key (load first so other plugins can register groups)

vim.pack.add({
    { src = "https://github.com/folke/which-key.nvim" },
})

require("which-key").setup()

-- GitSigns

vim.pack.add({
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
})

require('gitsigns').setup({ signcolumn = false })

require("which-key").add({ { "<leader>g", group = "git" } })

--ColourSchemes

vim.pack.add({
    { src = "https://github.com/mcauley-penney/techbase.nvim" },
})

require('techbase').setup({})


-- LSP, Formatters and Snippets
-- Mason

vim.pack.add({
    { src = "https://github.com/mason-org/mason.nvim" },
})

require("mason").setup({})


-- Treesitter

vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
})

require("treesitter")


-- Conform (formatting)

vim.pack.add({
    { src = "https://github.com/stevearc/conform.nvim" },
})

require("which-key").add({ { "<leader>c", group = "code" } })