vim.keymap.set('n', 'gl', function() vim.diagnostic.open_float() end,
  { desc = "Open Diagnostics in Float" }
)

vim.keymap.set("n", "<leader>tc", function()
  require("utils.colorscheme_picker").pick()
end, { desc = "Pick Colorscheme" })

vim.keymap.set('n', '<leader>uc', ':FzfLua colorschemes<CR>', { desc = 'Select Colorscheme' })

vim.keymap.set('n', '<leader>tt', ':ToggleTerm <CR>', {desc = "Opens terminal in vsplit"})
