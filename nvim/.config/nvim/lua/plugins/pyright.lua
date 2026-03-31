return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      pyright = {
        capabilities = {
          workspace = {
            didChangeWatchedFiles = {
              dynamicRegistration = true,
            },
          },
        },
      },
    },
  },
}
