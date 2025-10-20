return {
  "folke/which-key.nvim",
  dependencies = { { "nvim-mini/mini.icons", version = false } },
  event = "VeryLazy",
  opts = {
    preset = "helix", -- classic, modern, or helix
    delay = 0, -- задержка перед показом окна (ms)
    plugins = {
      marks = true, -- показывает список marks
      registers = true, -- показывает содержимое регистров
      spelling = {
        enabled = true, -- включить подсказки для z= (spell suggestions)
        suggestions = 20,
      },
      presets = {
        operators = true, -- операторы типа d, y, c
        motions = true, -- motion операторы типа w, e, b
        text_objects = true, -- text objects типа ap, iw
        windows = true, -- команды окон типа <C-w>
        nav = true, -- навигация типа ]], [[
        z = true, -- z команды
        g = true, -- g команды
      },
    },
    icons = {
      breadcrumb = "»", -- символ разделителя в цепочках команд
      separator = "➜", -- символ между клавишей и описанием
      group = "+", -- символ для групп
    },
    win = {
      border = "rounded", -- none, single, double, shadow, rounded
      padding = { 1, 2 }, -- отступы [top/bottom, right/left]
    },
    layout = {
      height = { min = 4, max = 25 },
      width = { min = 20, max = 50 },
      spacing = 3, -- расстояние между колонками
      align = "left", -- выравнивание: left, center, right
    },

    show_help = true, -- показывать help message в футере
    show_keys = true, -- показывать клавиши в окне
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    -- Регистрация групп команд с красивыми названиями
    wk.add({
      -- Neovim
      { "<leader>M", desc = "Mason" },
      { "<leader>L", desc = "Lazy" },

      -- Quit
      { "<leader>q", group = "Quit" },
      { "<leader>qq", desc = "Quit" },
      { "<leader>qa", desc = "Quit All" },

      -- Neotree
      { "<leader>e", desc = "Toggle Neotree" },
      { "<leader>o", desc = "Toggle Neotree Git" },

      -- Window
      { "<leader>|", desc = "Split Window Vertically" },
      { "<leader>-", desc = "Split Window Horizontally" },

      -- Telescope
      { "<leader>f", group = "Find" },
      { "<leader><leader>", desc = "File" },
      { "<leader>ff", desc = "File" },
      { "<leader>fg", desc = "Live Grep" },
      { "<leader>fw", desc = "Grep Up Cursor" },
      { "<leader>fb", desc = "Buffers" },
      { "<leader>fh", desc = "Tags" },
      { "<leader>fc", desc = "Commands" },
      { "<leader>fk", desc = "Keymaps" },
      { "<leader>fo", desc = "Recent files" },
      { "<leader>fr", desc = "Resume search" },
      { "<leader>fd", desc = "Diagnostics" },
      { "<leader>fs", desc = "Document symbols" },
      { "<leader>fm", desc = "Marks" },

      -- Git
      { "<leader>g", group = "Git" },
      { "<leader>gc", desc = "Git commits" },
      { "<leader>gs", desc = "Git status" },
      { "<leader>gb", desc = "Git branches" },

      -- UI
      { "<leader>u", group = "UI" },
      { "<leader>uC", desc = "Colorschemes" },

      -- { "<leader>b", group = "Buffer" },
      -- { "<leader>c", group = "Code" },
      -- { "<leader>d", group = "Debug" },
      -- { "<leader>f", group = "Find" },
      -- { "<leader>g", group = "Git" },
      -- { "<leader>l", group = "LSP" },
      -- { "<leader>s", group = "Split" },
      -- { "<leader>t", group = "Tab" },
      -- { "<leader>w", group = "Window" },
      -- { "<leader>x", group = "Diagnostics" },
      --
      -- -- LSP подгруппы
      -- { "<leader>la", desc = "Code Action" },
      -- { "<leader>ld", desc = "Line Diagnostics" },
      -- { "<leader>lD", desc = "Buffer Diagnostics" },
      -- { "<leader>lf", desc = "Format" },
      -- { "<leader>li", desc = "LSP Info" },
      -- { "<leader>lr", desc = "Rename" },
      -- { "<leader>ls", desc = "Restart LSP" },
      --
      -- -- Split/Window группы
      -- { "<leader>sh", desc = "Split Horizontal" },
      -- { "<leader>sv", desc = "Split Vertical" },
      -- { "<leader>se", desc = "Equal Size" },
      -- { "<leader>sx", desc = "Close Split" },
      --
      -- -- Tab группы
      -- { "<leader>to", desc = "New Tab" },
      -- { "<leader>tx", desc = "Close Tab" },
      -- { "<leader>tn", desc = "Next Tab" },
      -- { "<leader>tp", desc = "Previous Tab" },
      --
      -- -- Базовые команды
      -- { "<leader>q", desc = "Quit" },
      -- { "<leader>w", desc = "Save" },
      -- { "<leader>x", desc = "Save & Quit" },
      --
      -- -- Go to маппинги
      -- { "gd", desc = "Go to Definition" },
      -- { "gD", desc = "Go to Declaration" },
      -- { "gi", desc = "Go to Implementation" },
      -- { "gt", desc = "Go to Type Definition" },
      -- { "gR", desc = "Show References" },
      --
      -- -- Диагностика
      -- { "[d", desc = "Previous Diagnostic" },
      -- { "]d", desc = "Next Diagnostic" },
      --
      -- -- LSP hover
      -- { "K", desc = "Hover Documentation" },
    })
  end,
}
