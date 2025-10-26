return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      icons_enabled = true,
      theme = "auto",
      component_separators = { left = " ", right = "|" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = { "neo-tree", "alpha" },
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      always_show_tabline = false,
      globalstatus = true,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
        refresh_time = 16, -- ~60fps
        events = {
          "WinEnter",
          "BufEnter",
          "BufWritePost",
          "SessionLoadPost",
          "FileChangedShellPost",
          "VimResized",
          "Filetype",
          "CursorMoved",
          "CursorMovedI",
          "ModeChanged",
        },
      },
    },
    sections = {
      lualine_a = { { "mode", icon = "" } },
      lualine_b = {
        {
          function()
            local devicons = require("nvim-web-devicons")
            local filename = vim.fn.expand("%:t")
            local parent = vim.fn.expand("%:p:h:t")
            local extension = vim.fn.expand("%:e")
            local icon = devicons.get_icon(filename, extension, { default = true })
            return icon .. " " .. parent .. "/" .. filename
          end,
        },
      },
      lualine_c = { { "branch", icon = "" }, "diff" },
      lualine_x = { "diagnostics", "filetype", "lsp_status" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = { "neo-tree" },
  },
}
