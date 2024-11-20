return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      ruby = { "rubocop" },
      eruby = { "erb_format" },
    },
    formatters = {
      rubocop = function()
        return {
          command = "bundle",
          args = {
            "exec",
            "rubocop",
            "--server",
            "--autocorrect",
            "--format",
            "quiet",
            "--stderr",
            "--stdin",
            "$FILENAME",
          },
          stdin = true,
        }
      end,
    },
  },
}
