return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter", -- only loads in insert mode
    opts = {
      check_ts = true,     -- enables treesitter integration
      disable_filetype = { "TelescopePrompt", "vim" },
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)
    end,
  }
}
