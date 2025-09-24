return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "RRethy/nvim-treesitter-endwise",
  },
  opts = {
    ensure_installed = { "ruby" },
    endwise = { enable = true },
  },
}
