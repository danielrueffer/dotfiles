return {
  {
    "zbirenbaum/copilot.lua",
    keys = {
      {
        "<leader>ce",
        function()
          require("copilot").setup({ suggestion = { enabled = true } })
        end,
        desc = "Enable Copilot",
      },
      {
        "<leader>cd",
        function()
          require("copilot").setup({ suggestion = { enabled = false } })
        end,
        desc = "Disable Copilot",
      },
    },
    lazy = false, -- Load this plugin immediately (adjust based on your preference)
    branch = "create-pull-request/update-copilot-dist",

    config = function(_, opts)
      local new_opts = vim.tbl_extend("force", opts, {
        server_opts_overrides = {
          cmd = {
            "node",
            vim.api.nvim_get_runtime_file("copilot/dist/language-server.js", false)[1],
            "--stdio",
          },
          init_options = {
            copilotIntegrationId = "vscode-chat",
          },
        },
      })

      require("copilot").setup(new_opts)

      local util = require("copilot.util")
      local orig_get_editor_configuration = util.get_editor_configuration

      ---@diagnostic disable-next-line: duplicate-set-field
      util.get_editor_configuration = function()
        local config = orig_get_editor_configuration()

        return vim.tbl_extend("force", config, {
          github = {
            copilot = {
              selectedCompletionModel = "gpt-4o-copilot",
            },
          },
        })
      end

      return new_opts
    end,
  },
}
