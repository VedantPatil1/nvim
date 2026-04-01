local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local s       = require("settings")

-- Yank highlight
autocmd("TextYankPost", {
    group    = augroup("yank-highlight", { clear = true }),
    pattern  = "*",
    callback = function() vim.highlight.on_yank({ timeout = 170 }) end,
})

-- Per-filetype indent (settings.indent)
local indent_group = augroup("filetype-indent", { clear = true })
for ft, i in pairs(s.indent) do
    autocmd("FileType", {
        group   = indent_group,
        pattern = ft,
        callback = function()
            vim.opt_local.shiftwidth  = i.sw
            vim.opt_local.tabstop     = i.ts
            vim.opt_local.softtabstop = i.sw
            vim.opt_local.expandtab   = i.et
        end,
    })
end

-- Treesitter: highlighting + indent per buffer
autocmd("FileType", {
    group    = augroup("treesitter-attach", { clear = true }),
    callback = function(args)
        pcall(vim.treesitter.start, args.buf)
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})

-- LSP: native completion autotrigger
autocmd("LspAttach", {
    group    = augroup("lsp-completion", { clear = true }),
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, args.data.client_id, args.buf, { autotrigger = true })
        end
    end,
})

-- LSP: document highlight on cursor hold
autocmd("LspAttach", {
    group    = augroup("lsp-highlight", { clear = true }),
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if not (client and client:supports_method("textDocument/documentHighlight", event.buf)) then
            return
        end
        local hl = augroup("lsp-highlight-buf", { clear = false })
        autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf, group = hl, callback = vim.lsp.buf.document_highlight,
        })
        autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf, group = hl, callback = vim.lsp.buf.clear_references,
        })
        autocmd("LspDetach", {
            group    = augroup("lsp-detach", { clear = true }),
            callback = function(e)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds({ group = "lsp-highlight-buf", buffer = e.buf })
            end,
        })
    end,
})
