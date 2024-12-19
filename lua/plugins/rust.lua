return {
  -- Rust tools for enhanced LSP
  {
    "simrat39/rust-tools.nvim",
    config = function()
      require("rust-tools").setup({
        server = require("lazyvim.util").get_lsp_config("rust_analyzer"),
      })
    end,
    ft = { "rust" },
  },
  -- Null-ls for formatting with rustfmt
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local null_ls = require("null-ls")
      opts.sources = opts.sources or {}
      vim.list_extend(opts.sources, {
        null_ls.builtins.formatting.rustfmt,
      })
    end,
  },
}
