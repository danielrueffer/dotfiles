return {
  "nvim-neotest/neotest",
  commit = "3c81345c28cd639fcc02843ed3653be462f47024",
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
        formatter = "json",
      },
    },
  },
}
