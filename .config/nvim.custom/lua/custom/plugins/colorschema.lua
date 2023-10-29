return {
  -- add onenord
  -- { "rmehri01/onenord.nvim" },

  -- add onedark
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    opts = { style = "warmer" },
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme onedark]])
    end,
  },

  -- add catppuccin
  -- { "catppuccin/nvim" },

  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = true,
  --   priority = 1000,
  --   opts = { style = "storm" },
  -- },
}
