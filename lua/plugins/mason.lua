return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    -- Базовая настройка Mason
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
        border = "rounded",
      },
    })

    -- Mason LSP Config - только для установки серверов
    mason_lspconfig.setup({
      ensure_installed = {
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "lua_ls",
        "graphql",
        "prismals",
        "pyright",
        "rust_analyzer",
        "jsonls",
      },
      automatic_installation = true,
    })

    -- Установка дополнительных инструментов
    mason_tool_installer.setup({
      ensure_installed = {
        -- Форматеры
        "prettierd",
        "stylua",
        -- Линтеры
        "eslint_d",
        "ruff",
      },
      auto_update = true,
      run_on_start = true,
    })
  end,
}
