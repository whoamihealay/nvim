vim.g.mapleader = " "
vim.keymap.maplocalleader = "\\"

-- Open file explorer
vim.keymap.set("n", "<leader>fd", vim.cmd.Ex, { desc = "File explorer" })
vim.keymap.set("n", "<Tab>", "<C-w>w", { desc = "Next window" })
vim.keymap.set("n", "<S-Tab>", "<C-w>W", { desc = "Previous window" })

-- Move selected line / block of text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Keep cursor in place when joining lines
vim.keymap.set("n", "J", "mzJ`z")
-- Keep cursor centered when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
-- Keep search results centered
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result centered" })

vim.keymap.set("n", "=ap", "ma=ap'a", { desc = "Autoindent paragraph" })
-- LSP restart
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>", { desc = "Restart LSP" })

-- Paste over currently selected text without yanking it
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste over selection" })

-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
-- Yank whole line to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })
-- Delete to void register
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete to void register" })

-- Disable ex mode
vim.keymap.set("n", "Q", "<nop>", { desc = "Disable Ex mode" })

-- Quickfix and location list navigation with centering
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next quickfix item" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Previous quickfix item" })
-- Location list navigation with centering
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next location list item" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous location list item" })

-- Substitute word under cursor throughout the file
vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Substitute word under cursor" }
)
-- Delete word under cursor
vim.keymap.set("i", "<C-bs>", "<C-w>", { desc = "Delete word before cursor" })

-- Escape terminal
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
