local keymap = vim.keymap.set

vim.g.mapleader = " "

-- LSP completion: manual trigger
keymap("i", "<C-Space>", function() vim.lsp.completion.trigger() end, { desc = "Trigger LSP completion" })

-- Format
keymap("n", "<leader>cf", function() require("conform").format({ async = true }) end, { desc = "Format buffer" })

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
