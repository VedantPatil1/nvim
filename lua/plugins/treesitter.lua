-- Treesitter
vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
})

local parsers = {
	"go",
	"gomod",
	"gowork",
	"gosum",
	"templ",
	"python",
	"bash",
	"html",
	"css",
	"javascript",
	"json",
	"jsonc",
	"yaml",
	"markdown",
	"markdown_inline",
	"vim",
	"vimdoc",
	"diff",
	"lua",
}

require("nvim-treesitter").setup({})
require("nvim-treesitter").install(parsers)
require("nvim-treesitter-textobjects").setup({
	select = {
		lookahead = true,
		include_surrounding_whitespace = true,
		selection_modes = {
			["@parameter.outer"] = "v",
			["@function.outer"] = "V",
			["@class.outer"] = "<c-v>",
		},
	},
})
