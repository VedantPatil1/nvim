local keymap = vim.keymap.set

vim.g.mapleader = " "

-- LSP completion: manual trigger
keymap("i", "<C-Space>", function() vim.lsp.completion.trigger() end, { desc = "Trigger LSP completion" })

-- Format
keymap("n", "<leader>cf", function() require("conform").format({ async = true }) end, { desc = "Format buffer" })

-- Flash
keymap({ "n", "x", "o" }, "s",     function() require("flash").jump() end,             { desc = "Flash jump" })
keymap({ "n", "x", "o" }, "S",     function() require("flash").treesitter() end,        { desc = "Flash treesitter" })
keymap("o",               "r",     function() require("flash").remote() end,            { desc = "Flash remote" })
keymap({ "o", "x" },      "R",     function() require("flash").treesitter_search() end, { desc = "Flash treesitter search" })
keymap("c",               "<C-s>", function() require("flash").toggle() end,            { desc = "Toggle flash search" })

-- FZF
keymap("n", "<leader><leader>", function() require("fzf-lua").files() end,                                    { desc = "Find files" })
keymap("n", "<leader>fb",       function() require("fzf-lua").buffers() end,                                  { desc = "Find buffers" })
keymap("n", "<leader>fn",       function() require("fzf-lua").files({ cwd = vim.fn.stdpath("config") }) end,  { desc = "Find in nvim config" })
keymap("n", "<leader>fg",       function() require("fzf-lua").live_grep() end,                                { desc = "Live grep" })
keymap("n", "<leader>fh",       function() require("fzf-lua").helptags() end,                                 { desc = "Find help" })

-- Treesitter: textobjects
local ts_select_obj = function(query, group)
    return function() require("nvim-treesitter-textobjects.select").select_textobject(query, group) end
end

local xo = { "x", "o" }
keymap(xo, "af", ts_select_obj("@function.outer", "textobjects"), { desc = "outer function" })
keymap(xo, "if", ts_select_obj("@function.inner", "textobjects"), { desc = "inner function" })
keymap(xo, "ac", ts_select_obj("@class.outer",    "textobjects"), { desc = "outer class" })
keymap(xo, "ic", ts_select_obj("@class.inner",    "textobjects"), { desc = "inner class" })
keymap(xo, "as", ts_select_obj("@local.scope",    "locals"),      { desc = "scope" })
