return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "rose-pine/neovim", name = "rose-pine" },
  {
    "Jas-SinghFSU/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-jas",
    },
  },
}
