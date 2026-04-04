local keymap  = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local wk      = require("which-key")

vim.g.mapleader = " "

-- Which-key groups
wk.add({
    { "<leader>a", group = "ai"      },
    { "<leader>c", group = "code"    },
    { "<leader>f", group = "find"    },
    { "<leader>g", group = "git"     },
    { "<leader>u", group = "ui"      },
    { "<leader>w", group = "window"  },
})

local s = require("settings")
-- Diagnostics
keymap("n", "gl", function() vim.diagnostic.open_float() end, { desc = "Show line diagnostics" })

-- Format
keymap("n", "<leader>cf", function() require("conform").format({ async = true }) end, { desc = "Format buffer" })

-- Flash
keymap({ "n", "x", "o" }, "s",     function() require("flash").jump() end,              { desc = "Flash jump" })
keymap({ "n", "x", "o" }, "S",     function() require("flash").treesitter() end,        { desc = "Flash treesitter" })
keymap("o",               "r",     function() require("flash").remote() end,            { desc = "Flash remote" })
keymap({ "o", "x" },      "R",     function() require("flash").treesitter_search() end, { desc = "Flash treesitter search" })
keymap("c",               "<C-s>", function() require("flash").toggle() end,            { desc = "Toggle flash search" })

-- FZF
keymap("n", "<leader><leader>", function() require("fzf-lua").files() end,                                   { desc = "Find files" })
keymap("n", "<leader>fb",       function() require("fzf-lua").buffers() end,                                 { desc = "Find buffers" })
keymap("n", "<leader>fn",       function() require("fzf-lua").files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Find in nvim config" })
keymap("n", "<leader>fg",       function() require("fzf-lua").live_grep() end,                               { desc = "Live grep" })
keymap("n", "<leader>fh",       function() require("fzf-lua").helptags() end,                                { desc = "Find help" })

-- Todo comments
keymap("n", "<leader>ft", function() require("todo-comments.fzf").todo() end,                                          { desc = "Find todos (workspace)" })
keymap("n", "<leader>fT", function() require("todo-comments.fzf").todo({ cwd = vim.fn.expand("%:p:h") }) end,          { desc = "Find todos (file)" })
keymap("n", "<leader>ff", function() require("todo-comments.fzf").todo({ keywords = { "FIX", "FIXME", "BUG" } }) end, { desc = "Find fixmes" })

-- UI
keymap("n", "<leader>uc", function() require("fzf-lua").colorschemes() end, { desc = "Pick colorscheme" })

-- Treesitter: textobjects
local ts = function(query, group)
    return function() require("nvim-treesitter-textobjects.select").select_textobject(query, group) end
end
local xo = { "x", "o" }
keymap(xo, "af", ts("@function.outer", "textobjects"), { desc = "outer function" })
keymap(xo, "if", ts("@function.inner", "textobjects"), { desc = "inner function" })
keymap(xo, "ac", ts("@class.outer",    "textobjects"), { desc = "outer class" })
keymap(xo, "ic", ts("@class.inner",    "textobjects"), { desc = "inner class" })
keymap(xo, "as", ts("@local.scope",    "locals"),      { desc = "scope" })

-- Terminal
keymap("n", "<leader>wt", "<cmd>15split | terminal<CR>", { desc = "Open terminal (hsplit)" })
keymap("t", "<Esc>",      "<C-\\><C-n>",                 { desc = "Exit terminal mode" })

-- LSP: buffer-local keymaps (set on attach)
autocmd("LspAttach", {
    group    = augroup("lsp-keymaps", { clear = true }),
    callback = function(event)
        local buf    = event.buf
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        local map    = function(keys, func, desc, mode)
            keymap(mode or "n", keys, func, { buffer = buf, desc = "LSP: " .. desc })
        end

        map("grr", function() require("fzf-lua").lsp_references()             end, "references")
        map("gri", function() require("fzf-lua").lsp_implementations()        end, "implementation")
        map("grd", function() require("fzf-lua").lsp_definitions()            end, "definition")
        map("grt", function() require("fzf-lua").lsp_typedefs()               end, "type definition")
        map("gO",  function() require("fzf-lua").lsp_document_symbols()       end, "document symbols")
        map("gW",  function() require("fzf-lua").lsp_live_workspace_symbols() end, "workspace symbols")

        if client and client:supports_method("textDocument/inlayHint", buf) then
            map("<leader>ci", function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = buf }))
            end, "toggle inlay hints")
        end
    end,
})
