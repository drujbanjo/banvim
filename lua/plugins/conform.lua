return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        -- JavaScript/TypeScript
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },

        -- Web
        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },

        -- GraphQL
        graphql = { "prettier" },

        -- Lua
        lua = { "stylua" },

        -- Python
        python = { "ruff" },

        -- Rust
        rust = { "rust-analyzer" },
      },

      -- Форматирование при сохранении
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },

      -- Дополнительные опции форматеров
      formatters = {
        prettier = {
          prepend_args = {
            "--single-quote",
            "--trailing-comma",
            "es5",
            "--print-width",
            "120",
            "--tab-width",
            "2",
          },
        },
        stylua = {
          prepend_args = {
            "--indent-type",
            "Spaces",
            "--indent-width",
            "2",
          },
        },
      },
    })

    -- Маппинг для ручного форматирования
    vim.keymap.set({ "n", "v" }, "<leader>lf", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range" })

    -- Команда для форматирования
    vim.api.nvim_create_user_command("Format", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      conform.format({ async = true, lsp_fallback = true, range = range })
    end, { range = true })
  end,
}
