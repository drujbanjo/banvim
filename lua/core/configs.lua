vim.opt.formatoptions = "qrn1"
vim.virtualedit = "block"
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 100

-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.wo.number = true
vim.wo.relativenumber = true

-- Split
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Mouse
vim.opt.mouse = "a"
vim.opt.mousefocus = true

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Indents
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.smartindent = true

-- Short messeges
vim.opt.shortmess:append("c")

-- Filchars
vim.opt.fillchars = {
  vert = "│", -- вертикальная линия разделителя
  fold = " ", -- символ для свернутых блоков
  eob = " ", -- символ конца буфера (убирает символ ~)
  diff = "⠿", -- символ для различий в diff (⠿,░)
  msgsep = "‾", -- символ разделителя сообщений
  foldopen = "▾", -- символ раскрытого блока
  foldsep = "│", -- символ разделителя блоков
  foldclose = "▸", -- символ закрытого блока
}
