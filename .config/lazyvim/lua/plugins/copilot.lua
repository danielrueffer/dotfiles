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
    options = {
      copilot_model = "gpt-4o-copilot",
    },
  },
}
