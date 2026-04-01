vim.keymap.set('n', 'gl', function() vim.diagnostic.open_float() end,
  { desc = "Open Diagnostics in Float" }
)

vim.keymap.set('n', '<leader>uc', ':FzfLua colorschemes<CR>', { desc = 'Select Colorscheme' })
