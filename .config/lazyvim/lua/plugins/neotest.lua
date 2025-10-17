return {
  "nvim-neotest/neotest",
  commit = "3c81345c28cd639fcc02843ed3653be462f47024",
  dependencies = {
    "olimorris/neotest-rspec",
  },
  opts = {
    adapters = {
      ["neotest-rspec"] = {
        rspec_cmd = function(position_type)
          if position_type == "test" then
            return vim
              .iter({
                "bin/run",
                "rspec",
                "--fail-fast",
              })
              :flatten()
              :totable()
          else
            return vim
              .iter({
                "bin/run",
                "rspec",
              })
              :flatten()
              :totable()
          end
        end,

        transform_spec_path = function(path)
          local prefix = require("neotest-rspec").root(path)
          if not prefix then
            return path
          end
          return string.sub(path, string.len(prefix) + 2, -1)
        end,

        results_path = "tmp/rspec.output",
        formatter = "json",
      },
    },
  },
}
