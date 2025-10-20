return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "typescript",
      "javascript",
      "tsx",
      "html",
      "css",
      "json",
      "graphql",
      "prisma",
      "lua",
      "vim",
      "python",
      "rust",
      "markdown",
    },
    auto_install = true,
    sync_install = false,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
  },
}
