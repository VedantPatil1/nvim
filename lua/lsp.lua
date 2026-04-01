vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            completion = { callSnippet = "Replace" },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = { enable = false },
        },
    },
})

vim.lsp.enable({ "lua_ls" })

vim.diagnostic.config({
    severity_sort = true,
    virtual_text = true,
    underline = { severity = vim.diagnostic.severity.ERROR },
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
    callback = function(event)
        local buf = event.buf
        local map = function(keys, func, desc, mode)
            vim.keymap.set(mode or "n", keys, func, { buffer = buf, desc = "LSP: " .. desc })
        end

        -- Override gr* with fzf-lua pickers
        map("grr", function() require("fzf-lua").lsp_references() end,              "references")
        map("gri", function() require("fzf-lua").lsp_implementations() end,         "implementation")
        map("grd", function() require("fzf-lua").lsp_definitions() end,             "definition")
        map("grt", function() require("fzf-lua").lsp_typedefs() end,                "type definition")

        -- Symbol pickers
        map("gO",  function() require("fzf-lua").lsp_document_symbols() end,        "document symbols")
        map("gW",  function() require("fzf-lua").lsp_live_workspace_symbols() end,  "workspace symbols")

        -- Inlay hints toggle (code group)
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client:supports_method("textDocument/inlayHint", buf) then
            map("<leader>ci", function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = buf }))
            end, "toggle inlay hints")
        end

        -- Document highlight on cursor hold
        if client and client:supports_method("textDocument/documentHighlight", buf) then
            local group = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = buf, group = group, callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = buf, group = group, callback = vim.lsp.buf.clear_references,
            })
            vim.api.nvim_create_autocmd("LspDetach", {
                group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
                callback = function(e)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = e.buf })
                end,
            })
        end
    end,
})
