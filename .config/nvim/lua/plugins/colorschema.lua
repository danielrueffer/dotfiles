return {
  -- add onenord
  -- { "rmehri01/onenord.nvim" },

  -- add onedark
  {
    "navarasu/onedark.nvim",
    lazy = true,
    priority = 1000,
    opts = { style = "warmer" },
  },

  -- add catppuccin
  -- { "catppuccin/nvim" },

  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = true,
  --   priority = 1000,
  --   opts = { style = "storm" },
  -- },

  -- Configure LazyVim to load onedark
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
