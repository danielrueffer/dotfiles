return {
  "CopilotC-Nvim/CopilotChat.nvim",
  opts = {
    prompts = {
      Specs = {
        prompt = "> /COPILOT_GENERATE\n\nPlease generate specs for my code.",
      },
    },
    keys = {
      {
        "<leader>aa",
        function()
          return require("CopilotChat").toggle()
        end,
        desc = "Toggle (CopilotChat)",
        mode = { "n", "v" },
      },
    },
  },
}
