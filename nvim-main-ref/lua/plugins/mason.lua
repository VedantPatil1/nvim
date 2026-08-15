return{
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          -- Go
          "goimports",
          "gofmt",

          -- Python
          "ruff",
          "black",

          -- Terraform / HCL
          "terraform",
          "packer",

          -- SQL
          "sqlfluff",

          -- Web
          "prettier",

          -- Templ
          "templ",

          -- Robot Framework
          "robotframework-lsp",
        },
        auto_update = false,
        run_on_start = true,
      })
    end,
  }
}

