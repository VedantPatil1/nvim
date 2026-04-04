-- settings.lua: edit this file to add languages, change features, swap colorscheme.
-- No setup calls here — just data consumed by other files.

return {
    colorscheme = "techbase",

    enable = {
        hardtime = true,
        showkeys = false,
        copilot  = false,
        opencode   = false,
        claudecode = true,
    },

    -- Add server names here to enable them. Config lives in lsp/<name>.lua
    lsp = {
        "lua_ls",
        "gopls",
        "templ",
        "html",
        "htmx",
        "tailwindcss",
        "emmet_ls",
        "ts_ls",
    },

    formatters = {
        lua        = { "stylua"   },
        python     = { "black"    },
        go         = { "gofmt"    },
        templ      = { "templ"    },
        javascript = { "prettier" },
        typescript = { "prettier" },
        html       = { "prettier" },
        css        = { "prettier" },
        json       = { "prettier" },
        yaml       = { "prettier" },
    },

    parsers = {
        "go", "gomod", "gowork", "gosum",
        "templ",
        "python",
        "bash",
        "html", "css", "javascript",
        "json", "jsonc", "yaml",
        "markdown", "markdown_inline",
        "vim", "vimdoc", "diff",
        "lua",
    },

    indent = {
        lua        = { sw = 2, ts = 2, et = true  },
        python     = { sw = 4, ts = 4, et = true  },
        go         = { sw = 8, ts = 8, et = false },
        javascript = { sw = 2, ts = 2, et = true  },
        html       = { sw = 2, ts = 2, et = true  },
        gohtml     = { sw = 2, ts = 2, et = true  },
        css        = { sw = 2, ts = 2, et = true  },
        make       = { sw = 8, ts = 8, et = false },
        json       = { sw = 2, ts = 2, et = true  },
        yaml       = { sw = 2, ts = 2, et = true  },
        terraform  = { sw = 2, ts = 2, et = true  },
    },
}
