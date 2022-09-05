require("nvim-treesitter.configs").setup(
  {
    ensure_installed = { "javascript", "typescript", "lua", "rust", "ruby", "yaml", "tsx", "toml", "python", "markdown", "json", "html", "hcl", "gitignore", "dockerfile", "css" },
    highlight = {
      enable = true
    }
  }
)
