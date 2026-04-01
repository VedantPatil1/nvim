# nvim config

Personal Neovim configuration using native Neovim 0.12 APIs where possible. No plugin manager — uses the built-in `vim.pack`.

## Structure

```
init.lua              Entry point. Requires files in order: plugins → configs → keymaps → autocmds
lua/
  settings.lua        The file to edit. Languages, formatters, parsers, colorscheme, feature toggles.
  plugins.lua         Plugin declarations (vim.pack.add) and setup calls. Rarely touched.
  configs.lua         vim.opt settings, filetype registration, diagnostics, LSP enable.
  keymaps.lua         All keymaps and which-key group registrations.
  autocmds.lua        All autocommands (yank highlight, indent, treesitter attach, LSP events).
lsp/
  lua_ls.lua          Per-server LSP config. Auto-loaded by Neovim when the server is enabled.
```

## Adding a language

1. Open `lua/settings.lua`
2. Add the server name to `lsp = { ... }`
3. Add formatters to `formatters = { ... }`
4. Add parsers to `parsers = { ... }`
5. Add indent settings to `indent = { ... }`
6. Create `lsp/<server_name>.lua` with the server config (see `lsp/lua_ls.lua` as reference)

## Keymaps

| Key | Action |
|-----|--------|
| `<leader><leader>` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Find buffers |
| `<leader>fh` | Find help |
| `<leader>fn` | Find in nvim config |
| `<leader>ft` | Find todos (workspace) |
| `<leader>fT` | Find todos (file) |
| `<leader>ff` | Find fixmes |
| `<leader>cf` | Format buffer |
| `<leader>ci` | Toggle inlay hints |
| `<leader>uc` | Pick colorscheme |
| `gl` | Show line diagnostics |
| `grr` | LSP references |
| `grd` | LSP definition |
| `gri` | LSP implementation |
| `grt` | LSP type definition |
| `gO` | Document symbols |
| `gW` | Workspace symbols |
| `s` | Flash jump |
| `S` | Flash treesitter |
| `af/if` | outer/inner function (textobject) |
| `ac/ic` | outer/inner class (textobject) |

## Requirements

- Neovim 0.12+
- `fzf`, `ripgrep` (for fzf-lua)
- A C compiler (for treesitter parser compilation)
- Mason-installed tools: run `:Mason` to install LSP servers and formatters
