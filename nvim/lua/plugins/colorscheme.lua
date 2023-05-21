return {
  -- { "folke/tokyonight.nvim", lazy = true, opts = { lualine_bold = true } },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      -- flavour = "macchiato",
      integrations = {
        leap = true,
      },
    },
  },
  -- {
  --   -- this one is named onedark
  --   "olimorris/onedarkpro.nvim",
  --   priority = 1000, -- Ensure it loads first
  -- },
  -- { "rose-pine/neovim", name = "rose-pine", opts = { variant = "moon" } },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
