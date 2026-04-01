require("conform").setup({
    formatters_by_ft = {
        lua        = { "stylua" },
        python     = { "black" },
        go         = { "gofmt" },
        javascript = { "prettier" },
        html       = { "prettier" },
        css        = { "prettier" },
        json       = { "prettier" },
        yaml       = { "prettier" },
    },
})
