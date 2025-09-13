-- General keybindings
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }


-- Quick save and quit
keymap("n", "<leader>q", "<cmd>q<CR>", opts)

-- Clear search
keymap("n", "<leader>sc", "<cmd>nohlsearch<CR>", opts)

-- Tabs Management
keymap("n", "<leader><tab>n", "<cmd>tabnew<CR>", opts, { desc = "[Tab] [N]ew"})
keymap("n", "<leader><tab>c", "<cmd>tabclose<CR>", opts, { desc = "[Tab] [C]lose"})
keymap("n", "<leader><tab>o", "<cmd>tabonly<CR>", opts, { desc = "[O]nly keep this [Tab]"})
keymap("n", "<leader><tab>n", "<cmd>tabnew<CR>", opts, { desc = "[Tab] [N]ew"})

keymap("n", "<leader>cd", "<cmd>lua vim.lsp.buf.hover()<CR>", opts, { desc = "[c]ode [d]ocs"})
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
