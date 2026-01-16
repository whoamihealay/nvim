vim.g.mapleader = " "
vim.keymap.maplocalleader = "\\"

-- Open file explorer
vim.keymap.set("n", "<leader>fd", vim.cmd.Ex, { desc = "File explorer" })
vim.keymap.set("n", "<Tab>", "<C-w>w")

-- Move selected line / block of text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in place when joining lines
vim.keymap.set("n", "J", "mzJ`z")
-- Keep cursor centered when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Keep search results centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "=ap", "ma=ap'a")
-- LSP restart
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

-- Paste over currently selected text without yanking it
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- Yank whole line to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])
-- Delete to void register
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')

-- Disable ex mode
vim.keymap.set("n", "Q", "<nop>")

-- Quickfix and location list navigation with centering
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- Location list navigation with centering
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Substitute word under cursor throughout the file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
