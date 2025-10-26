local keymap = vim.keymap

-- Neovim
keymap.set("n", "<leader>m", "<cmd> Mason <CR>")
keymap.set("n", "<leader>l", "<cmd> Lazy <CR>")

keymap.set("n", "<C-a>", "ggVG", { desc = "Select All" })

-- Save
keymap.set({ "i", "n", "s", "x" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Quit
keymap.set("n", "<leader>qq", "<cmd>q<CR>")
keymap.set("n", "<leader>qa", "<cmd>qa<CR>")

-- Neotree
keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>")
keymap.set("n", "<leader>o", "<cmd>Neotree git_status<CR>")

-- Window
keymap.set("n", "<leader>w", "<C-w>", { noremap = true })
keymap.set("n", "<leader>|", "<C-w>v")
keymap.set("n", "<leader>-", "<C-w>s")
keymap.set("n", ",", "<C-w><")
keymap.set("n", ".", "<C-w>>")
keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

-- Code
keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
keymap.set("n", "<leader>cD", "<cmd>Telescope diagnostics bufnr=0<CR>")
keymap.set("n", "<leader>cd", vim.diagnostic.open_float)
keymap.set("n", "<leader>cr", vim.lsp.buf.rename)
keymap.set("n", "K", vim.lsp.buf.hover)
keymap.set("n", "<C-k>", vim.lsp.buf.signature_help)
keymap.set("n", "<leader>cs", ":LspRestart<CR>")
keymap.set("n", "<leader>ci", ":LspInfo<CR>")

-- Move lines up/down
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })

-- Clear search highlights
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- UI
keymap.set("n", "<leader>ut", "<cmd>TSBufToggle highlight<CR>")
keymap.set("n", "<leader>uT", "<cmd>TSToggle highlight<CR>")
