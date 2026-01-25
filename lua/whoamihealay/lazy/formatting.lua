return {
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				format_on_save = {
					timeout_ms = 5000,
					lsp_format = "fallback",
				},
				formatters_by_ft = {
					c = { "clang-format" },
					cpp = { "clang-format" },
					lua = { "stylua" },
					go = { "gofmt" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					elixir = { "mix" },
					hcl = { "packer_fmt" },
					["markdown"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
					["markdown.mdx"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
					terraform = { "terraform_fmt" },
					tf = { "terraform_fmt" },
					["terraform-vars"] = { "terraform_fmt" },
				},
				formatters = {
					["clang-format"] = {
						prepend_args = { "-style=file", "-fallback-style=LLVM" },
						["markdown-toc"] = {
							condition = function(_, ctx)
								for _, line in ipairs(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false)) do
									if line:find("<!%-%- toc %-%->") then
										return true
									end
								end
							end,
						},
						["markdownlint-cli2"] = {
							condition = function(_, ctx)
								local diag = vim.tbl_filter(function(d)
									return d.source == "markdownlint"
								end, vim.diagnostic.get(ctx.buf))
								return #diag > 0
							end,
						},
					},
				},
			})

			vim.keymap.set("n", "<leader>fm", function()
				require("conform").format({ bufnr = 0 })
			end, { desc = "File format" })
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = function()
			require("lazy").load({ plugins = { "markdown-preview.nvim" } })
			vim.fn["mkdp#util#install"]()
		end,
		keys = {
			{
				"<leader>cp",
				ft = "markdown",
				"<cmd>MarkdownPreviewToggle<cr>",
				desc = "Markdown Preview",
			},
		},
		config = function()
			vim.cmd([[do FileType]])
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		opts = {
			code = {
				sign = false,
				width = "block",
				right_pad = 1,
			},
			heading = {
				sign = false,
				icons = {},
			},
			checkbox = {
				enabled = false,
			},
		},
		ft = { "markdown", "norg", "rmd", "org", "codecompanion" },
		config = function(_, opts)
			require("render-markdown").setup(opts)
			Snacks.toggle({
				name = "Render Markdown",
				get = require("render-markdown").get,
				set = require("render-markdown").set,
			}):map("<leader>um")
		end,
	},
}
