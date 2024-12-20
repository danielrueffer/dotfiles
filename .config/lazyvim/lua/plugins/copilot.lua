return {
  "zbirenbaum/copilot.lua",
  config = function()
    -- Function to enable Copilot based on the working directory
    local function enable_copilot_for_directory()
      local cwd = vim.loop.cwd()
      local directories_to_enable = { "~/personal" } -- Update these paths as needed

      for _, dir in ipairs(directories_to_enable) do
        if cwd:find(vim.fn.expand(dir), 1, true) then
          require("copilot").setup({
            suggestion = { enabled = true },
            panel = { enabled = true },
          })
          vim.notify("Copilot enabled for: " .. cwd, vim.log.levels.INFO)
          return
        end
      end

      vim.notify("Copilot not enabled for: " .. cwd, vim.log.levels.WARN)
    end

    -- Call the function to enable Copilot during startup
    enable_copilot_for_directory()
  end,
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
}
