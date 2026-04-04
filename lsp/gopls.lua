---@type vim.lsp.Config
return {
    cmd        = { "gopls" },
    filetypes  = { "go", "gomod", "gowork", "gosum" },
    root_markers = { "go.work", "go.mod", ".git" },
    settings = {
        gopls = {
            gofumpt   = true,
            completeUnimported = true,
            staticcheck        = true,
            usePlaceholders    = true,
            analyses = {
                nilness       = true,
                unusedparams  = true,
                unusedwrite   = true,
                useany        = true,
            },
            hints = {
                assignVariableTypes    = true,
                compositeLiteralFields = true,
                compositeLiteralTypes  = true,
                constantValues         = true,
                functionTypeParameters = true,
                parameterNames         = true,
                rangeVariableTypes     = true,
            },
            codelenses = {
                generate          = true,
                run_govulncheck   = true,
                test              = true,
                tidy              = true,
                upgrade_dependency = true,
            },
            directoryFilters = { "-.git", "-.vscode", "-node_modules" },
            semanticTokens   = true,
        },
    },
}
