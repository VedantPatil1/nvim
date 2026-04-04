-- Conform

local formatters = {
	lua = { "stylua" },
	python = { "black" },
	go = { "gofmt" },
	templ = { "templ" },
	javascript = { "prettier" },
	typescript = { "prettier" },
	html = { "prettier" },
	css = { "prettier" },
	json = { "prettier" },
	yaml = { "prettier" },
}

vim.pack.add({ { src = "https://github.com/stevearc/conform.nvim" } })
require("conform").setup({ formatters_by_ft = formatters })
