return {
  opts = {
    autotag = { enable = true },
    endwise = { enable = true },
    highlight = { enable = true, additional_vim_regex_highlighting = false },
    indent = { enable = true },
    context_commentstring = { enable = true, enable_autocmd = false },
    ensure_installed = {
      "bash",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "ruby",
      "tsx",
      "vim",
      "yaml",
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = "<nop>",
        node_decremental = "<bs>",
      },
    },
  },
  ---@param opts TSConfig
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,

  "RRethy/nvim-treesitter-endwise",
}