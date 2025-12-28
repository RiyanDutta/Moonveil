return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        hidden = true,
        sources = {
          files = {
            hidden = true, -- show dotfiles
            ignored = false, -- do not respect .gitignore
          },
        },
      },
    },
  },
}
