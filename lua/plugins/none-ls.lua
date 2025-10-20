return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    local formatting = null_ls.builtins.formatting

    null_ls.setup({
      sources = {
        -- JavaScript/TypeScript/React/GraphQL
        formatting.prettierd.with({
          condition = function(utils)
            return utils.root_has_file({
              ".prettierrc",
              ".prettierrc.json",
              ".prettierrc.js",
              "prettier.config.js",
              ".prettierrc.yml",
              ".prettierrc.yaml",
            })
          end,
          filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "vue",
            "css",
            "scss",
            "less",
            "html",
            "json",
            "jsonc",
            "yaml",
            "markdown",
            "markdown.mdx",
            "graphql",
            "handlebars",
          },
        }),

        -- Python
        -- formatting.ruff,

        -- Lua
        formatting.stylua,
      },
    })
  end,
}
