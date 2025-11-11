return {
  {
    "kylechui/nvim-surround",
    version = "*", -- use a released version
    event = "VeryLazy", -- or "BufReadPost" if you prefer earlier load
    config = function()
      require("nvim-surround").setup({})
    end,
  },
}
