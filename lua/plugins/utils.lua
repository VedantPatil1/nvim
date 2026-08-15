-- Utility plugins with little to no required configs.

-- which-key (load first so other plugins can register groups)
vim.pack.add({ { src = "https://github.com/folke/which-key.nvim" } })
require("which-key").setup()

-- GitSigns
vim.pack.add({ { src = "https://github.com/lewis6991/gitsigns.nvim" } })
require("gitsigns").setup({ signcolumn = false })

-- Mason
vim.pack.add({ { src = "https://github.com/mason-org/mason.nvim" } })
require("mason").setup({})

-- Mini pairs
vim.pack.add({ { src = "https://github.com/echasnovski/mini.pairs" } })
require("mini.pairs").setup()

-- Dressing (better vim.ui.select / vim.ui.input as floating windows)
vim.pack.add({ { src = "https://github.com/stevearc/dressing.nvim" } })
require("dressing").setup()

-- Hardtime
vim.pack.add({
    { src = "https://github.com/MunifTanjim/nui.nvim" },
    { src = "https://github.com/m4xshen/hardtime.nvim" },
})
require("hardtime").setup()

-- Showkeys
vim.pack.add({ { src = "https://github.com/nvzone/showkeys" } })
require("showkeys").setup({ timeout = 1, maxkeys = 4, show_count = true })

-- Feature toggles
require("hardtime").enable()

-- Flash
vim.pack.add({ { src = "https://github.com/folke/flash.nvim" } })
require("flash").setup()

