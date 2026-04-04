local s = require("settings")

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


