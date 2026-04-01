local s = require("settings")

-- which-key (load first so other plugins can register groups)
vim.pack.add({ { src = "https://github.com/folke/which-key.nvim" } })
require("which-key").setup()

-- GitSigns
vim.pack.add({ { src = "https://github.com/lewis6991/gitsigns.nvim" } })
require("gitsigns").setup({ signcolumn = false })

-- ColourSchemes
vim.pack.add({ { src = "https://github.com/mcauley-penney/techbase.nvim" } })
require("techbase").setup({})
vim.cmd.colorscheme(s.colorscheme)

-- Mason
vim.pack.add({ { src = "https://github.com/mason-org/mason.nvim" } })
require("mason").setup({})

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

-- Mini pairs
vim.pack.add({ { src = "https://github.com/echasnovski/mini.pairs" } })
require("mini.pairs").setup()

-- Flash
vim.pack.add({ { src = "https://github.com/folke/flash.nvim" } })
require("flash").setup()

-- Hardtime
vim.pack.add({
    { src = "https://github.com/MunifTanjim/nui.nvim" },
    { src = "https://github.com/m4xshen/hardtime.nvim" },
})
require("hardtime").setup()

-- Showkeys
vim.pack.add({ { src = "https://github.com/nvzone/showkeys" } })
require("showkeys").setup({ timeout = 1, maxkeys = 4, show_count = true })

-- Feature toggles (after plugins are set up)
if s.enable.hardtime then require("hardtime").enable() end
if s.enable.showkeys  then vim.cmd("ShowkeysToggle")    end
