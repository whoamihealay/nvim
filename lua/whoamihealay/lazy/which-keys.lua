return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
		defaults = {},
		spec = {
			{
				mode = { "n", "x" },
				{ "<leader>g", group = "git" },
				{ "<leader>f", group = "file/find" },
				{ "<leader>x", group = "diagnostics" },
			},
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
