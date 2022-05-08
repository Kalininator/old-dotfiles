require("nvim-treesitter.configs").setup(
  {
    ensure_installed = { "javascript", "lua", "rust", "ruby" },
    highlight = {
      enable = true
    }
  }
)
