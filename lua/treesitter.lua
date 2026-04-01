-- Parser installation
require("nvim-treesitter").setup()

require("nvim-treesitter").install({
    "go", "gomod", "gowork", "gosum",
    "templ",
    "python",
    "bash",
    "html", "css", "javascript",
    "json", "jsonc", "yaml",
    "markdown", "markdown_inline",
    "vim", "vimdoc", "diff",
    "lua",
})

-- Highlighting + indent via native Neovim API
vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        pcall(vim.treesitter.start, args.buf)
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})

-- Textobjects behaviour config (keymaps are in keymaps.lua)
require("nvim-treesitter-textobjects").setup({
    select = {
        lookahead = true,
        include_surrounding_whitespace = true,
        selection_modes = {
            ["@parameter.outer"] = "v",
            ["@function.outer"]  = "V",
            ["@class.outer"]     = "<c-v>",
        },
    },
})
