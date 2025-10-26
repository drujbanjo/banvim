return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      -- Компактный стиль
      stages = "fade_in_slide_out", -- или "slide" для более плавной анимации

      -- Компактный рендер
      render = "compact", -- компактный стиль отображения

      -- Быстрое исчезновение
      timeout = 2000, -- 2 секунды

      -- Позиция (можно изменить на "top_right", "bottom_left" и т.д.)
      top_down = false, -- новые уведомления снизу вверх

      -- Иконки
      icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "",
        TRACE = "✎",
      },

      -- Уровень прозрачности
      opacity = 100,
    })

    -- Устанавливаем как дефолтный notify
    vim.notify = require("notify")
  end,
}
