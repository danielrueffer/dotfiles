return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "j-hui/fidget.nvim", opts = {} },
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        solargraph = {
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
        },
      },
    },
  },
}
