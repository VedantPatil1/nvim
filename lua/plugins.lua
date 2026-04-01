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


-- FZF

vim.pack.add({
    { src = "https://github.com/echasnovski/mini.icons" },
    { src = "https://github.com/ibhagwan/fzf-lua" },
})

require("mini.icons").setup()
require("fzf-lua").setup()

require("which-key").add({ { "<leader>f", group = "find" } })


-- Mini pairs

vim.pack.add({
    { src = "https://github.com/echasnovski/mini.pairs" },
})

require("mini.pairs").setup()


-- Flash

vim.pack.add({
    { src = "https://github.com/folke/flash.nvim" },
})

require("flash").setup()


-- Hardtime

vim.pack.add({
    { src = "https://github.com/MunifTanjim/nui.nvim" },
    { src = "https://github.com/m4xshen/hardtime.nvim" },
})

require("hardtime").setup()


-- Showkeys

vim.pack.add({
    { src = "https://github.com/nvzone/showkeys" },
})

require("showkeys").setup({
    timeout  = 1,
    maxkeys  = 4,
    show_count = true,
})