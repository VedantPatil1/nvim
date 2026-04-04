---@type vim.lsp.Config
return {
    cmd       = { "emmet-language-server", "--stdio" },
    filetypes = { "html", "templ", "css", "scss", "sass", "less", "javascript", "javascriptreact", "typescriptreact" },
    root_markers = { "package.json", ".git" },
}
