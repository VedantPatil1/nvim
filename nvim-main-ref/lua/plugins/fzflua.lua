return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  dependencies = { "echasnovski/mini.icons" },
  opts = {},
  keys={
    {
      "<Leader><Leader>",
      function() require('fzf-lua').files() end,
      desc="Find Files in current Working Directory."
    },
    {
      "<Leader>fb",
      function() require('fzf-lua').buffers() end,
      desc="Find Files in current Working Directory."
    },
    {
      "<Leader>fn",
      function() require('fzf-lua').files({ cwd=vim.fn.stdpath("config") }) end,
      desc="[F]ind in [N]eovim Config Directory."
    },
    {
      "<Leader>fg",
      function() require('fzf-lua').live_grep() end,
      desc="[F]ind [c]ode in Working Directory."
    },
    {
      "<Leader>fh",
      function() require('fzf-lua').helptags() end,
      desc="[F]ind in [h]elp"
    }
  }
}
