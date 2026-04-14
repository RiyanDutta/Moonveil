return {
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        -- Your custom options here, or leave empty for defaults
        "*", -- Highlight all files
      })
    end,
  },
}
