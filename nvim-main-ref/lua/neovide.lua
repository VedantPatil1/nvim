vim.o.guifont = "CaskaydiaCove Nerd Font Mono:h15" -- text below applies for VimScript

vim.cmd("colorscheme kanagawa-wave")

vim.g.neovide_input_macos_option_key_is_meta = 'only_left'

-- 2. The Blurred Look (Modern Settings)
-- Opacity is the inverse of transparency: 1.0 is solid, 0.0 is invisible.
-- 0.8 is usually the sweet spot for a clean blurred background.
vim.g.neovide_opacity = 0.8

-- This enables the "Frosted Glass" effect on macOS
vim.g.neovide_window_blurred = true

-- 3. Visual Polish
-- Hide the macOS title bar for a truly seamless look
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_theme = "auto" -- Match system light/dark mode
