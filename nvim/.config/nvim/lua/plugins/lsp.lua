return {
  "neovim/nvim-lspconfig",
  lazy = false,
  opts = {
    servers = {
      ruby_lsp = {
        mason = false,
        enabled = true,
      },
      rubocop = {
        mason = false,
        enabled = false,
      },
    },
  },
}
