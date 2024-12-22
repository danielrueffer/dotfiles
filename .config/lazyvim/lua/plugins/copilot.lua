return {
  "zbirenbaum/copilot.lua",
  config = function()
    -- Function to load the appropriate token
    local function load_token_for_directory()
      local cwd = vim.loop.cwd()
      local tokens = {
        personal = "~/personal",
        work = "~/work",
      }

      -- Load tokens from a JSON file
      local ok, token_data = pcall(function()
        local file = io.open(vim.fn.expand("~/.copilot_tokens"), "r")
        local content = file:read("*a")
        file:close()
        return vim.json.decode(content)
      end)

      if not ok or not token_data then
        vim.notify("Failed to load Copilot tokens", vim.log.levels.ERROR)
        return nil
      end

      for account, dir in pairs(tokens) do
        if cwd:find(vim.fn.expand(dir), 1, true) then
          return token_data[account]
        end
      end

      vim.notify("No Copilot token found for directory: " .. cwd, vim.log.levels.WARN)
      return nil
    end

    -- Set up Copilot with the appropriate token
    local token = load_token_for_directory()
    if token then
      require("copilot").setup({
        auth = {
          token = token,
        },
        suggestion = { enabled = true },
        panel = { enabled = true },
      })
      vim.notify("Copilot configured for directory: " .. vim.loop.cwd(), vim.log.levels.INFO)
    end
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
