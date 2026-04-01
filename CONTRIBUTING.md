# Contributing

Guidelines for keeping the config consistent as it grows.

## Principles

- **`settings.lua` is the only file that should change for language work.** Adding a language must not require editing plugins, configs, keymaps, or autocmds.
- **One concern per file.** If you find yourself adding an autocommand to `keymaps.lua` or a keymap to `autocmds.lua`, stop and reconsider.
- **No abstractions for one-off things.** Three similar lines is fine. A helper function is only warranted when the pattern appears across multiple files.
- **Plugins stay in `plugins.lua`.** Only `vim.pack.add` and `.setup()` calls. No logic, no conditionals beyond feature toggles.

## File responsibilities

| File | What belongs here |
|------|-------------------|
| `settings.lua` | LSP server list, formatters, parsers, indent, colorscheme, feature toggles |
| `plugins.lua` | `vim.pack.add`, `.setup()` calls, feature toggle execution |
| `configs.lua` | `vim.opt`, filetype registration, `vim.lsp.enable`, diagnostics config |
| `keymaps.lua` | All `vim.keymap.set` calls, which-key group registrations, LspAttach for buffer-local keymaps |
| `autocmds.lua` | All `nvim_create_autocmd` calls — yank, indent, treesitter attach, LSP completion, doc highlight |
| `lsp/<name>.lua` | Per-server `vim.lsp.Config` table, auto-loaded by Neovim |

## Adding a plugin

1. Add `vim.pack.add` entry in `plugins.lua`
2. Call `.setup()` immediately after in `plugins.lua`
3. If it has keymaps, add them to `keymaps.lua`
4. If it needs which-key groups, add to the `wk.add({...})` block in `keymaps.lua`
5. If it needs autocommands, add them to `autocmds.lua`
6. If it is a feature toggle (optional on/off), add an entry to `settings.enable` and wire it in `plugins.lua`

## Adding an LSP server

1. Add the server name to `settings.lsp`
2. Create `lsp/<server_name>.lua` returning a `vim.lsp.Config` table
3. Add its formatter to `settings.formatters` if applicable
4. Add its parser to `settings.parsers` if applicable
5. Add its indent settings to `settings.indent` if it differs from the default (4 spaces)

## Keymaps

- Use `<leader>c` for code actions (format, refactor, inlay hints)
- Use `<leader>f` for find/search actions
- Use `<leader>g` for git actions
- Use `<leader>u` for UI toggles (colorscheme, etc.)
- `g` prefix for LSP navigation (`grr`, `grd`, `gri`, `grt`, `gO`, `gW`)
- Avoid remapping common motions unless there is a strong reason
