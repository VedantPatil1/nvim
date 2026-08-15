---@type vim.lsp.Config
return {
    cmd       = { "tailwindcss-language-server", "--stdio" },
    filetypes = { "templ", "html", "css", "javascript", "typescript", "javascriptreact", "typescriptreact" },
    root_markers = { "tailwind.config.js", "tailwind.config.ts", "package.json", ".git" },
    init_options = {
        userLanguages = { templ = "html" },
    },
}
