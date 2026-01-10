return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():prepend()
		end, { desc = "harpoon: prepend" })
		vim.keymap.set("n", "<leader>A", function()
			harpoon:list():add()
		end, { desc = "harpoon: add" })
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "harpoon: menu" })
		vim.keymap.set("n", "<M-1>", function()
			harpoon:list():select(1)
		end, { desc = "harpoon: select 1" })
		vim.keymap.set("n", "<M-2>", function()
			harpoon:list():select(2)
		end, { desc = "harpoon: select 2" })
		vim.keymap.set("n", "<M-3>", function()
			harpoon:list():select(3)
		end, { desc = "harpoon: select 3" })
		vim.keymap.set("n", "<M-4>", function()
			harpoon:list():select(4)
		end, { desc = "harpoon: select 4" })
		vim.keymap.set("n", "<M-n>", function()
			harpoon:list():next()
		end, { desc = "harpoon: next" })
		vim.keymap.set("n", "<M-p>", function()
			harpoon:list():prev()
		end, { desc = "harpoon: prev" })
	end,
}
