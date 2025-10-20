return {
  "neovim/nvim-lspconfig",
  version = false,
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    "williamboman/mason.nvim", -- Добавьте эту зависимость
  },
  config = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- Настройка capabilities для автодополнения
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Настройка диагностики
    vim.diagnostic.config({
      virtual_text = {
        prefix = "●",
        source = "if_many",
      },
      signs = true,
      update_in_insert = false,
      underline = true,
      severity_sort = true,
      float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })

    -- Иконки для диагностики
    local signs = {
      Error = " ",
      Warn = " ",
      Hint = "󰠠 ",
      Info = " ",
    }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Обработчики для улучшения UI
    local handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
    }

    -- Автокоманда для маппингов при подключении LSP
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        -- Маппинги навигации
        opts.desc = "Show LSP references"
        vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Go to declaration"
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP definitions"
        vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

        opts.desc = "Show LSP implementations"
        vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

        opts.desc = "Show LSP type definitions"
        vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

        -- Маппинги действий
        opts.desc = "See available code actions"
        vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts)

        opts.desc = "Smart rename"
        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)

        opts.desc = "Format buffer"
        vim.keymap.set({ "n", "v" }, "<leader>lf", function()
          vim.lsp.buf.format({ async = true })
        end, opts)

        -- Маппинги диагностики
        opts.desc = "Show buffer diagnostics"
        vim.keymap.set("n", "<leader>lD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

        opts.desc = "Show line diagnostics"
        vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)

        opts.desc = "Go to previous diagnostic"
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

        opts.desc = "Go to next diagnostic"
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

        -- Маппинги документации
        opts.desc = "Show documentation for what is under cursor"
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Show signature help"
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

        -- Маппинги управления
        opts.desc = "Restart LSP"
        vim.keymap.set("n", "<leader>ls", ":LspRestart<CR>", opts)

        opts.desc = "Show LSP info"
        vim.keymap.set("n", "<leader>li", ":LspInfo<CR>", opts)
      end,
    })

    -- ========================================
    -- Настройка LSP серверов (НОВЫЙ API)
    -- ========================================

    -- TypeScript/JavaScript
    vim.lsp.config("ts_ls", {
      capabilities = capabilities,
      handlers = handlers,
      settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
        javascript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },
      },
    })

    -- Prisma
    vim.lsp.config("prismals", {
      capabilities = capabilities,
      handlers = handlers,
    })

    -- GraphQL
    vim.lsp.config("graphql", {
      capabilities = capabilities,
      handlers = handlers,
    })

    -- CSS/SCSS/Less
    vim.lsp.config("cssls", {
      capabilities = capabilities,
      handlers = handlers,
      settings = {
        css = {
          validate = true,
          lint = {
            unknownAtRules = "ignore",
          },
        },
        scss = {
          validate = true,
          lint = {
            unknownAtRules = "ignore",
          },
        },
        less = {
          validate = true,
          lint = {
            unknownAtRules = "ignore",
          },
        },
      },
    })

    -- HTML
    vim.lsp.config("html", {
      capabilities = capabilities,
      handlers = handlers,
    })

    -- JSON
    vim.lsp.config("jsonls", {
      capabilities = capabilities,
      handlers = handlers,
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    })

    -- Tailwind CSS
    vim.lsp.config("tailwindcss", {
      capabilities = capabilities,
      handlers = handlers,
      settings = {
        tailwindCSS = {
          classAttributes = { "class", "className", "classList", "ngClass" },
          lint = {
            cssConflict = "warning",
            invalidApply = "error",
            invalidConfigPath = "error",
            invalidScreen = "error",
            invalidTailwindDirective = "error",
            invalidVariant = "error",
            recommendedVariantOrder = "warning",
          },
          validate = true,
        },
      },
    })

    -- Python
    vim.lsp.config("pyright", {
      capabilities = capabilities,
      handlers = handlers,
      settings = {
        python = {
          analysis = {
            autoSearchPaths = true,
            diagnosticMode = "workspace",
            useLibraryCodeForTypes = true,
            typeCheckingMode = "basic",
          },
        },
      },
    })

    -- Ruff (Python linter/formatter)
    vim.lsp.config("ruff", {
      capabilities = capabilities,
      handlers = handlers,
    })

    -- Rust
    vim.lsp.config("rust_analyzer", {
      capabilities = capabilities,
      handlers = handlers,
      settings = {
        ["rust-analyzer"] = {
          diagnostics = {
            enable = true,
          },
          cargo = {
            allFeatures = true,
            loadOutDirsFromCheck = true,
          },
          procMacro = {
            enable = true,
          },
          checkOnSave = {
            command = "clippy",
          },
        },
      },
    })

    -- Lua (для конфигурации Neovim)
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      handlers = handlers,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })

    -- Включение LSP серверов
    vim.lsp.enable("ts_ls")
    vim.lsp.enable("prismals")
    vim.lsp.enable("graphql")
    vim.lsp.enable("cssls")
    vim.lsp.enable("html")
    vim.lsp.enable("jsonls")
    vim.lsp.enable("tailwindcss")
    vim.lsp.enable("pyright")
    vim.lsp.enable("ruff")
    vim.lsp.enable("rust_analyzer")
    vim.lsp.enable("lua_ls")
  end,
}
