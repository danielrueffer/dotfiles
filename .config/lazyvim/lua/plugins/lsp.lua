return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ruby_lsp = {
        mason = false,
        enabled = true,
        cmd = { "/Users/danielrueffer/.asdf/shims/ruby-lsp" },
        filetypes = { "ruby", "rakefile" },
      },
      rubocop = {
        mason = false,
        enabled = false,
      },
    },
  },
}
