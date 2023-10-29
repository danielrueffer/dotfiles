return {
  opts = {
    autotag = { enable = true },
    endwise = { enable = true },
    highlight = { additional_vim_regex_highlighting = false },
    context_commentstring = { enable = true, enable_autocmd = false },
    ensure_installed = {
      "ruby",
    },
  },
  ---@param opts TSConfig
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,

  "RRethy/nvim-treesitter-endwise",
}
