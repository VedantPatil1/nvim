return {
	{
    "rebelot/kanagawa.nvim",
    config=function()
      require("kanagawa").setup({
        compile=true,
      });
      -- vim.cmd("colorscheme kanagawa")
    end,
    build = function()
      vim.cmd("KanagawaCompile")
    end
  },
  {
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 1000,
  },
  { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...}
}

