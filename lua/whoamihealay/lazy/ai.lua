return {
	{
		"yetone/avante.nvim",
		build = vim.fn.has("win32") ~= 0
				and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
			or "make",
		event = "VeryLazy",
		version = false,
		opts = {
			provider = "copilot",
			selection = {
				hint_display = "none",
			},
			behaviour = {
				auto_set_keymaps = false,
			},
		},
		cmd = {
			"AvanteAsk",
			"AvanteBuild",
			"AvanteChat",
			"AvanteClear",
			"AvanteEdit",
			"AvanteFocus",
			"AvanteHistory",
			"AvanteModels",
			"AvanteRefresh",
			"AvanteShowRepoMap",
			"AvanteStop",
			"AvanteSwitchProvider",
			"AvanteToggle",
		},
		keys = {
			{ "<leader>aa", "<cmd>AvanteAsk<CR>", desc = "Ask Avante" },
			{ "<leader>ac", "<cmd>AvanteChat<CR>", desc = "Chat with Avante" },
			{ "<leader>ae", "<cmd>AvanteEdit<CR>", desc = "Edit Avante" },
			{ "<leader>af", "<cmd>AvanteFocus<CR>", desc = "Focus Avante" },
			{ "<leader>ah", "<cmd>AvanteHistory<CR>", desc = "Avante History" },
			{ "<leader>am", "<cmd>AvanteModels<CR>", desc = "Select Avante Model" },
			{ "<leader>an", "<cmd>AvanteChatNew<CR>", desc = "New Avante Chat" },
			{ "<leader>ap", "<cmd>AvanteSwitchProvider<CR>", desc = "Switch Avante Provider" },
			{ "<leader>ar", "<cmd>AvanteRefresh<CR>", desc = "Refresh Avante" },
			{ "<leader>as", "<cmd>AvanteStop<CR>", desc = "Stop Avante" },
			{ "<leader>at", "<cmd>AvanteToggle<CR>", desc = "Toggle Avante" },
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"saghen/blink.cmp",
			"ibhagwan/fzf-lua",
			"folke/snacks.nvim",
			"nvim-mini/mini.icons",
			"zbirenbaum/copilot.lua",
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows
						use_absolute_path = true,
					},
				},
			},
			{
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		event = "BufReadPost",
		opts = {
			suggestion = {
				enabled = false,
				-- auto_trigger = true,
				-- hide_during_completion = vim.g.ai_cmp,
				-- keymap = {
				-- 	accept = false, -- handled by nvim-cmp / blink.cmp
				-- 	next = "<M-]>",
				-- 	prev = "<M-[>",
				-- },
			},
			panel = { enabled = false },
			filetypes = {
				javascript = true,
				typescript = true,
				python = true,
				terraform = true,
				lua = true,
				markdown = true,
				help = true,
			},
		},
	},
}
