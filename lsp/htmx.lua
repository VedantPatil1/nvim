---@type vim.lsp.Config
return {
    cmd       = { "htmx-lsp" },
    filetypes = { "html", "templ" },
    root_markers = { "package.json", ".git" },
}
