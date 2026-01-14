return {
  "danymat/neogen",

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "L3MON4D3/LuaSnip",
  },

  cmd = "Neogen",

  keys = {
    {
      "<leader>nd",
      function()
        require("neogen").generate({ type = "func" })
      end,
      desc = "Generate function docstring",
      ft = "python",
    },
    {
      "<leader>nc",
      function()
        require("neogen").generate({ type = "class" })
      end,
      desc = "Generate class docstring",
      ft = "python",
    },
  },

  opts = {
    enabled = true,

    input_after_comment = true,

    -- THIS is the missing piece
    snippet_engine = "luasnip",

    languages = {
      python = {
        template = {
          annotation_convention = "google_docstrings",
        },
      },
    },
  },

  config = function(_, opts)
    require("neogen").setup(opts)
  end,
}
