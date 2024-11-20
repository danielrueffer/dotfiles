return {
  "nvim-neotest/neotest",
  dependencies = {
    "olimorris/neotest-rspec",
  },
  opts = {
    adapters = {
      ["neotest-rspec"] = {
        rspec_cmd = function()
          return vim.tbl_flatten({
            "bin/test",
          })
        end,

        transform_spec_path = function(path)
          local prefix = require("neotest-rspec").root(path)
          return string.sub(path, string.len(prefix) + 2, -1)
        end,

        results_path = "tmp/rspec.output",
      },
    },
  },
}
