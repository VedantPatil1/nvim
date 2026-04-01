return {
  "folke/todo-comments.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "ibhagwan/fzf-lua",
  },
  opts = {
    keywords = {
      TODO = { icon = " ", color = "info" },
      FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG" } },
      HACK = { icon = " ", color = "warning" },
      NOTE = { icon = "󰍨 ", color = "hint" },
      PERF = { icon = "󰅒 ", color = "warning", alt = { "OPTIMIZE" } },
    },
    highlight = {
      multiline = false,
    },
    search = {
      command = "rg",
      args = {
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
      },
      pattern = [[\b(KEYWORDS):]],
    },
  },

  keys = {
    {
      "<leader>ft",
      function()
        require("todo-comments.fzf").todo()
      end,
      desc = "[F]ind [T]odos (workspace)",
    },
    {
      "<leader>fT",
      function()
        require("todo-comments.fzf").todo({
          cwd = vim.fn.expand("%:p:h"),
        })
      end,
      desc = "[F]ind [T]odos (current file)",
    },
    {
      "<leader>ff",
      function()
        require("todo-comments.fzf").todo({
          keywords = { "FIX", "FIXME", "BUG" },
        })
      end,
      desc = "[F]ind [F]ixmes",
    },
  },
}
