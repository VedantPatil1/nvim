-- Highlight copied area
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', { clear = true }),
  desc = 'Hightlight when yanking (copying) text',
  callback = function()
    vim.highlight.on_yank()
  end,
})
