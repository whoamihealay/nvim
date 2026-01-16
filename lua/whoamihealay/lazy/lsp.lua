return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"stevearc/conform.nvim",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"j-hui/fidget.nvim",
		},

		config = function()
			require("conform").setup({
				formatters_by_ft = {},
			})

			local cmp = require("cmp")
			local cmp_lsp = require("cmp_nvim_lsp")

			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				cmp_lsp.default_capabilities()
			)

			require("fidget").setup({})
			require("mason").setup()

			require("mason-lspconfig").setup({
				ensure_installed = {
          "lua_ls",
					"tailwindcss",
					"vtsls",
				},

				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({
							capabilities = capabilities,
						})
					end,

					zls = function()
						local lspconfig = require("lspconfig")
						lspconfig.zls.setup({
							root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
							settings = {
								zls = {
									enable_inlay_hints = true,
									enable_snippets = true,
									warn_style = true,
								},
							},
						})

						vim.g.zig_fmt_parse_errors = 0
						vim.g.zig_fmt_autosave = 0
					end,

					lua_ls = function()
						local lspconfig = require("lspconfig")
						lspconfig.lua_ls.setup({
							capabilities = capabilities,
							settings = {
								Lua = {
									format = {
										enable = true,
										defaultConfig = {
											indent_style = "space",
											indent_size = "2",
										},
									},
								},
							},
						})
					end,

					tailwindcss = function()
						local lspconfig = require("lspconfig")
						lspconfig.tailwindcss.setup({
							capabilities = capabilities,
							filetypes = {
								"html",
								"css",
								"scss",
								"javascript",
								"javascriptreact",
								"typescript",
								"typescriptreact",
							},
						})
					end,
				},
			})

			local function has_words_before()
				local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
				if col == 0 then
					return false
				end
				local text = vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1] or ""
				return text:sub(col, col):match("%s") == nil
			end

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},

				mapping = {
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif vim.snippet.active({ direction = 1 }) then
							vim.schedule(function()
								vim.snippet.jump(1)
							end)
						elseif has_words_before() then
							cmp.complete()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif vim.snippet.active({ direction = -1 }) then
							vim.schedule(function()
								vim.snippet.jump(-1)
							end)
						else
							fallback()
						end
					end, { "i", "s" }),
				},

				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
			})

			vim.diagnostic.config({
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})
		end,
 	},

	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
}
