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

  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    lazy = true,
    priority = 1000,
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme kanagawa]])
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
