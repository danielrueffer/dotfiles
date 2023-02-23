return {
  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  { -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { "j-hui/fidget.nvim", opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      "folke/neodev.nvim",
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        solargraph = {},
      },
      setup = {
        solargraph = function(_, opts)
          require("lspconfig").solargraph.setup({
            filetypes = { "ruby", "rakefile" },
            cmd = { "/Users/daniel/.rbenv/shims/solargraph", "stdio" },
            settings = {
              solargraph = {
                autoformat = true,
                formatting = true,
                completion = true,
                definition = true,
                hover = true,
                diagnostic = true,
                folding = true,
                references = true,
                rename = true,
                symbols = true,
              },
            },
          })
        end,
      },
    },
  },
}
