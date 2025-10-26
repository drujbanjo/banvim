return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, but recommended
  },
  lazy = false, -- neo-tree will lazily load itself
  opts = {
    window = {
      width = 30,
      mappings = {
        ["P"] = {
          "toggle_preview",
          config = {
            use_float = false,
            title = "Neo-tree Preview",
          },
        },
      },
    },
    source_selector = {
      winbar = false,
      statusline = false,
    },
  },
}
