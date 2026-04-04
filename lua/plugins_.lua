local s = require("settings")

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
