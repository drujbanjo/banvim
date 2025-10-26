return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "tsx",
        "graphql",
        "html",
        "css",
        "markdown",
        "rust",
        "json",
        "markdown_inline",
        "toml",
        "yaml",
        "prisma",
      },
      auto_install = true,
      highlight = { enable = true },
    })
  end,
}
