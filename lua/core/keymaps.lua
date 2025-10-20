local keymap = vim.keymap

-- Neovim
keymap.set("n", "<leader>M", "<cmd>Mason<CR>")
keymap.set("n", "<leader>L", "<cmd>Lazy<CR>")

keymap.set("n", "<C-a>", "ggVG", { desc = "Select All" })

-- Save
keymap.set({ "i", "n", "s", "x" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Quit
keymap.set("n", "<leader>qq", "<cmd>q<CR")
keymap.set("n", "<leader>qa", "<cmd>qa<CR>")

-- Neotree
keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>")
keymap.set("n", "<leader>o", "<cmd>Neotree git_status<CR>")

-- Window
keymap.set("n", "<leader>|", "<C-w>v")
keymap.set("n", "<leader>-", "<C-w>s")
-- keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
-- keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Tab management
-- keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
-- keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
-- keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
-- keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })

-- Move lines up/down
-- keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
-- keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Better indenting
-- keymap.set("v", "<", "<gv", { desc = "Indent left" })
-- keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Keep cursor centered when scrolling
-- keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
-- keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- Clear search highlights
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
