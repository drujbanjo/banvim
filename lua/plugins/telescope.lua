return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- для быстрого поиска
    "nvim-tree/nvim-web-devicons", -- красивые иконки
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        -- Красивый вид
        prompt_prefix = "🔍 ",
        selection_caret = "➤ ",
        entry_prefix = "  ",

        -- Размеры окна
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "bottom", -- поиск снизу
            preview_width = 0.55, -- превью справа занимает 55%
            results_width = 0.45, -- список файлов слева занимает 45%
            mirror = false, -- превью справа, а не слева
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },

        -- Сортировка результатов сверху вниз
        sorting_strategy = "descending",

        -- Стиль границ
        border = true,
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },

        -- Цвета и прозрачность
        winblend = 0,

        -- Горячие клавиши внутри telescope
        mappings = {
          i = { -- в режиме вставки
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-d>"] = actions.preview_scrolling_down,
            ["<C-u>"] = actions.preview_scrolling_up,
            ["<Esc>"] = actions.close,
          },
          n = { -- в нормальном режиме
            ["q"] = actions.close,
            ["<C-d>"] = actions.preview_scrolling_down,
            ["<C-u>"] = actions.preview_scrolling_up,
          },
        },

        -- Превью файлов
        file_ignore_patterns = {
          "node_modules",
          ".git/",
          "dist/",
          "build/",
          "*.lock",
        },

        -- Treesitter подсветка в превью. Если включить то ошибка
        preview = {
          treesitter = false,
        },
      },

      pickers = {
        find_files = {
          hidden = true, -- показывать скрытые файлы
        },
        live_grep = {},
        buffers = {
          initial_mode = "normal",
          mappings = {
            i = {
              ["<C-d>"] = actions.delete_buffer,
            },
            n = {
              ["dd"] = actions.delete_buffer,
            },
          },
        },
      },
    })

    -- Загрузка расширения fzf для быстрого поиска
    telescope.load_extension("fzf")

    -- Горячие клавиши для вызова Telescope
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- Поиск файлов
    keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
    keymap("n", "<C-p>", "<cmd>Telescope find_files<cr>", opts)
    keymap("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", opts)

    -- Поиск по содержимому (grep)
    keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
    keymap("n", "<leader>fw", "<cmd>Telescope grep_string<cr>", opts) -- найти слово под курсором

    -- Буферы
    keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)

    -- Помощь и команды
    keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)
    keymap("n", "<leader>fc", "<cmd>Telescope commands<cr>", opts)
    keymap("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", opts)

    -- История
    keymap("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", opts)
    keymap("n", "<leader>fr", "<cmd>Telescope resume<cr>", opts)

    -- Git
    keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", opts)
    keymap("n", "<leader>gs", "<cmd>Telescope git_status<cr>", opts)
    keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", opts)

    -- LSP (если используете)
    keymap("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", opts)
    keymap("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", opts)

    -- Разное
    keymap("n", "<leader>uC", "<cmd>Telescope colorscheme<cr>", opts)
    keymap("n", "<leader>fm", "<cmd>Telescope marks<cr>", opts)
  end,
}
