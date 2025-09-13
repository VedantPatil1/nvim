return {
  {
    -- Formatter
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("conform").setup({
        format_on_save = false,
        notify_on_error = true,
        formatters_by_ft = {
          go = { "goimports", "gofmt" },
          python = { "ruff_fix", "black" },
          hcl = { "packer_fmt" },
          terraform = { "terraform_fmt", "terraform"},
          tf = { "terraform_fmt", "terraform" },
          ["terraform-vars"] = { "terraform_fmt" },
          robot = {'robotidy', 'robotframework_ls', 'robocode'}
        },
        formatters = {
          ruff_fix = {
            command = "ruff",
            args = { "check", "--fix", "--stdin-filename", "$FILENAME", "-" },
            stdin = true,
          },
          black = {
            command = "black",
            args = { "--quiet", "-" },
            stdin = true,
          },
        },
      })

      -- Format keybinding
      vim.keymap.set("n", "<leader>cf", function()
        require("conform").format({ async = true, lsp_fallback = false })
      end, { desc = "Format file" })
    end,
  }
}
