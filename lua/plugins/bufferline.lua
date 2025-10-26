return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  event = "VeryLazy",
  config = function()
    -- Функция для определения темы и получения соответствующих highlights
    local function get_highlights()
      local colorscheme = vim.g.colors_name or ""
      if colorscheme:match("catppuccin") then
        local palette = require("catppuccin.palettes").get_palette()
        local ok, catppuccin_bufferline = pcall(require, "catppuccin.special.bufferline")
        if ok then
          return catppuccin_bufferline.get_theme({
            custom = {
              all = {
                fill = { bg = palette.mantle }, -- Фон пустого пространства
                background = { bg = palette.mantle }, -- Фон неактивных буферов
                buffer_selected = { bg = palette.base }, -- Фон активного буфера
                buffer_visible = { bg = palette.mantle }, -- Фон видимых буферов
              },
            },
          })
        end
      end
      return nil
    end
    -- Функция для полной настройки bufferline
    local function setup_bufferline()
      require("bufferline").setup({
        highlights = get_highlights(),
        options = {
          offsets = {
            {
              filetype = "neo-tree",
              text = "",
              text_align = "center",
              separator = false,
            },
          },
          mode = "buffers",
          numbers = "none",
          close_command = "bdelete! %d",
          right_mouse_command = "bdelete! %d",
          left_mouse_command = "buffer %d",
          middle_mouse_command = nil,
          indicator = {
            icon = "▎",
            style = "icon",
          },
          buffer_close_icon = "󰅖",
          modified_icon = "●",
          close_icon = "",
          left_trunc_marker = "",
          right_trunc_marker = "",
          max_name_length = 18,
          max_prefix_length = 15,
          truncate_names = true,
          tab_size = 12,
          diagnostics = "nvim_lsp",
          diagnostics_update_in_insert = false,
          diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
          end,
          color_icons = false,
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          show_tab_indicators = true,
          show_duplicate_prefix = true,
          persist_buffer_sort = true,
          separator_style = "thin",
          enforce_regular_tabs = false,
          always_show_bufferline = false,
          hover = {
            enabled = true,
            delay = 200,
            reveal = { "close" },
          },
          sort_by = "insert_after_current",
        },
      })
    end
    -- Первоначальная настройка
    setup_bufferline()
    -- Автоматически обновляем при смене темы
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        -- Небольшая задержка для корректной загрузки темы
        vim.defer_fn(function()
          setup_bufferline()
        end, 100)
      end,
    })
    -- Маппинги
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }
    keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)
    keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)
    keymap("n", "<leader>bn", ":BufferLineMoveNext<CR>", opts)
    keymap("n", "<leader>bp", ":BufferLineMovePrev<CR>", opts)
    keymap("n", "<leader>bc", ":BufferLinePickClose<CR>", opts)
    keymap("n", "<leader>bd", ":bdelete<CR>", opts)
    keymap("n", "<leader>bD", ":bdelete!<CR>", opts)
    keymap("n", "<leader>bb", ":BufferLinePick<CR>", opts)
    keymap("n", "<leader>bo", ":BufferLineCloseOthers<CR>", opts)
    keymap("n", "<leader>bl", ":BufferLineCloseLeft<CR>", opts)
    keymap("n", "<leader>br", ":BufferLineCloseRight<CR>", opts)
  end,
}
