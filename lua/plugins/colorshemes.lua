return {
	{
    "rebelot/kanagawa.nvim",
    config=function()
      require("kanagawa").setup({
        compile=true,
        transparent = false,
      });
      vim.cmd("colorscheme kanagawa")
    end,
    build = function()
      vim.cmd("KanagawaCompile")
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "storm",
      -- transparent = true,
      -- styles = {
      --   sidebars = "transparent",
      --   floats = "transparent",
      -- },
    },
    config = function(_, opts)
      local tokyonight = require "tokyonight"
      tokyonight.setup(opts)
      tokyonight.load()
    end,
  },
  {
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 1000,
  },
  { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
  { 'Murtaza-Udaipurwala/gruvqueen', priority = 1000  },
  { 'Shatur/neovim-ayu', priority = 1000  }
}

