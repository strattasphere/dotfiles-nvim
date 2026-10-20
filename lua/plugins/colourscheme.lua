return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "folke/tokyonight.nvim" },
  { "catppuccin/nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}
