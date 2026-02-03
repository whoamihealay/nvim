return {
	{
		"neovim/nvim-lspconfig",
		-- event = "LazyFile",
		dependencies = {
			"mason.nvim",
			{ "mason-org/mason-lspconfig.nvim", config = function() end },
		},
		opts_extend = { "servers.*.keys" },
		opts = function()
			return {
				diagnostics = {
					underline = true,
					update_in_insert = false,
					virtual_text = {
						spacing = 4,
						source = "if_many",
						prefix = "●",
						-- this will set set the prefix to a function that returns the diagnostics icon based on the severity
						-- prefix = "icons",
					},
					severity_sort = true,
					signs = {
						text = {
							[vim.diagnostic.severity.ERROR] = " ",
							[vim.diagnostic.severity.WARN] = " ",
							[vim.diagnostic.severity.HINT] = " ",
							[vim.diagnostic.severity.INFO] = " ",
						},
					},
				},
				inlay_hints = {
					enabled = false,
				},
				codelens = {
					enabled = false,
				},
				folds = {
					enabled = true,
				},
				format = {
					formatting_options = nil,
					timeout_ms = nil,
				},
				servers = {
					["*"] = {
						root_dir = function(fanme)
							local util = require("lspconfig.util")
							return util.root_pattern(".git")(fname) or util.path.dirname(fname)
						end,
						capabilities = {
							workspace = {
								fileOperations = {
									didRename = true,
									willRename = true,
								},
							},
						},
            -- stylua: ignore
            keys = {
              { "<leader>cl", function() Snacks.picker.lsp_config() end, desc = "Lsp Info" },
              { "gd", vim.lsp.buf.definition, desc = "Goto Definition", has = "definition" },
              { "gr", vim.lsp.buf.references, desc = "References", nowait = true },
              { "gI", vim.lsp.buf.implementation, desc = "Goto Implementation" },
              { "gy", vim.lsp.buf.type_definition, desc = "Goto T[y]pe Definition" },
              { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
              { "K", function() return vim.lsp.buf.hover() end, desc = "Hover" },
              { "gK", function() return vim.lsp.buf.signature_help() end, desc = "Signature Help", has = "signatureHelp" },
              { "<c-k>", function() return vim.lsp.buf.signature_help() end, mode = "i", desc = "Signature Help", has = "signatureHelp" },
              { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "x" }, has = "codeAction" },
              { "<leader>cc", vim.lsp.codelens.run, desc = "Run Codelens", mode = { "n", "x" }, has = "codeLens" },
              { "<leader>cC", vim.lsp.codelens.refresh, desc = "Refresh & Display Codelens", mode = { "n" }, has = "codeLens" },
              { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File", mode ={"n"}, has = { "workspace/didRenameFiles", "workspace/willRenameFiles" } },
              { "<leader>cr", vim.lsp.buf.rename, desc = "Rename", has = "rename" },
              { "]]", function() Snacks.words.jump(vim.v.count1) end, has = "documentHighlight",
                desc = "Next Reference", enabled = function() return Snacks.words.is_enabled() end },
              { "[[", function() Snacks.words.jump(-vim.v.count1) end, has = "documentHighlight",
                desc = "Prev Reference", enabled = function() return Snacks.words.is_enabled() end },
              { "<a-n>", function() Snacks.words.jump(vim.v.count1, true) end, has = "documentHighlight",
                desc = "Next Reference", enabled = function() return Snacks.words.is_enabled() end },
              { "<a-p>", function() Snacks.words.jump(-vim.v.count1, true) end, has = "documentHighlight",
                desc = "Prev Reference", enabled = function() return Snacks.words.is_enabled() end },
            },
					},
					["azure_pipelines_ls"] = {
						settings = {
							yaml = {
								schemas = {
									["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = "/azure-pipelines*.y*l",
								},
							},
						},
					},
					yamlls = {
						capabilities = {
							textDocument = {
								foldingRange = {
									dynamicRegistration = false,
									lineFoldingOnly = true,
								},
							},
						},
						settings = {
							redhat = { telemetry = { enabled = false } },
							yaml = {
								keyOrdering = false,
								format = {
									enable = true,
								},
								validate = true,
								schemaStore = {
									-- Must disable built-in schemaStore support to use
									-- schemas from SchemaStore.nvim plugin
									enable = false,
									-- Avoid TypeError: Cannot read properties of undefined (reading 'length')
									url = "",
								},
								schemas = require("schemastore").yaml.schemas(),
							},
						},
					},
				},
				setup = {},
			}
		end,
		config = vim.schedule_wrap(function(_, opts)
			-- setup autoformat
			-- LazyVim.format.register(LazyVim.lsp.formatter())

			-- setup keymaps
			for server, server_opts in pairs(opts.servers) do
				if type(server_opts) == "table" and server_opts.keys then
					require("whoamihealay.utils.keymaps").set(
						{ name = server ~= "*" and server or nil },
						server_opts.keys
					)
				end
			end

			-- -- inlay hints
			if opts.inlay_hints.enabled then
				Snacks.util.lsp.on({ method = "textDocument/inlayHint" }, function(buffer)
					if
						vim.api.nvim_buf_is_valid(buffer)
						and vim.bo[buffer].buftype == ""
						and not vim.tbl_contains(opts.inlay_hints.exclude, vim.bo[buffer].filetype)
					then
						vim.lsp.inlay_hint.enable(true, { bufnr = buffer })
					end
				end)
			end

			-- code lens
			if opts.codelens.enabled and vim.lsp.codelens then
				Snacks.util.lsp.on({ method = "textDocument/codeLens" }, function(buffer)
					vim.lsp.codelens.refresh()
					vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
						buffer = buffer,
						callback = vim.lsp.codelens.refresh,
					})
				end)
			end

			-- diagnostics
			if type(opts.diagnostics.virtual_text) == "table" and opts.diagnostics.virtual_text.prefix == "icons" then
				opts.diagnostics.virtual_text.prefix = function(diagnostic)
					local icons = {
						Error = " ",
						Warn = " ",
						Hint = " ",
						Info = " ",
					}
					for d, icon in pairs(icons) do
						if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
							return icon
						end
					end
					return "●"
				end
			end
			vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

			if opts.servers["*"] then
				vim.lsp.config("*", opts.servers["*"])
			end

			-- get all the servers that are available through mason-lspconfig
			local mason_all = vim.tbl_keys(require("mason-lspconfig.mappings").get_mason_map().lspconfig_to_package)
				or {} --[[ @as string[] ]]
			local mason_exclude = {} ---@type string[]

			---@return boolean? exclude automatic setup
			local function configure(server)
				if server == "*" then
					return false
				end
				local sopts = opts.servers[server]
				sopts = sopts == true and {} or (not sopts) and { enabled = false } or sopts

				if sopts.enabled == false then
					mason_exclude[#mason_exclude + 1] = server
					return
				end

				local use_mason = sopts.mason ~= false and vim.tbl_contains(mason_all, server)
				local setup = opts.setup[server] or opts.setup["*"]
				if setup and setup(server, sopts) then
					mason_exclude[#mason_exclude + 1] = server
				else
					vim.lsp.config(server, sopts) -- configure the server
					if not use_mason then
						vim.lsp.enable(server)
					end
				end
				return use_mason
			end

			local install = vim.tbl_filter(configure, vim.tbl_keys(opts.servers))
			local function getOpts(name)
				local plugin = require("lazy.core.config").spec.plugins[name]
				if not plugin then
					return {}
				end
				local Plugin = require("lazy.core.plugin")
				return Plugin.values(plugin, "opts", false)
			end

			require("mason-lspconfig").setup({
				ensure_installed = vim.list_extend(install, getOpts("mason-lspconfig.nvim").ensure_installed or {}),
				automatic_enable = { exclude = mason_exclude },
			})
		end),
	},
	{
		"b0o/SchemaStore.nvim",
		lazy = true,
		version = false,
	},
}
