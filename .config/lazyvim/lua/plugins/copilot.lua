return {
  -- "zbirenbaum/copilot.lua",
  -- keys = {
  --   {
  --     "<leader>ce",
  --     function()
  --       require("copilot").setup({ suggestion = { enabled = true } })
  --     end,
  --     desc = "Enable Copilot",
  --   },
  --   {
  --     "<leader>cd",
  --     function()
  --       require("copilot").setup({ suggestion = { enabled = false } })
  --     end,
  --     desc = "Disable Copilot",
  --   },
  -- },
  -- lazy = false, -- Load this plugin immediately (adjust based on your preference)
  {
    "github/copilot.vim",
    lazy = false, -- Load immediately
    config = function()
      -- Disable Copilot's default Tab mapping
      -- vim.g.copilot_no_tab_map = 1
      vim.g.copilot_settings = { selectedCompletionModel = "gpt-4o-copilot" }
      vim.g.copilot_integration_id = "vscode-chat"
    end,
  },
}
