return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"Kaiser-Yang/blink-cmp-avante",
		"giuxtaposition/blink-cmp-copilot",
	},
	event = { "InsertEnter", "CmdlineEnter" },
	version = "1.*",
	opts_extend = {
		"sources.completion.enabled_providers",
		"sources.compat",
		"sources.default",
	},
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		appearance = {
			nerd_font_variant = "mono",
		},
		snippets = {
			preset = "default",
		},
		keymap = {
			preset = "enter",
			["<C-y>"] = { "select_and_accept" },
		},
		completion = {
			accept = {
				auto_brackets = {
					enabled = true,
				},
			},
			menu = {
				draw = {
					treesitter = { "lsp" },
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
			},
			ghost_text = {
				enabled = vim.g.ai_cmp,
			},
		},
		sources = {
			default = { "avante", "lazydev", "lsp", "path", "snippets", "buffer", "copilot" },
			per_filetype = {},
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- make lazydev completions top priority (see `:h blink.cmp`)
					score_offset = 100,
				},
				avante = {
					module = "blink-cmp-avante",
					name = "Avante",
					opts = {},
				},
				copilot = {
					module = "blink-cmp-copilot",
					name = "copilot",
					score_offset = 100,
					async = true,
				},
			},
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	config = function(_, opts)
		-- if opts.snippets and opts.snippets.preset == "default" then
		-- 	opts.snippets.expand = LazyVim.cmp.expand
		-- end
		-- setup compat sources
		local enabled = opts.sources.default
		for _, source in ipairs(opts.sources.compat or {}) do
			opts.sources.providers[source] = vim.tbl_deep_extend(
				"force",
				{ name = source, module = "blink.compat.source" },
				opts.sources.providers[source] or {}
			)
			if type(enabled) == "table" and not vim.tbl_contains(enabled, source) then
				table.insert(enabled, source)
			end
		end

		local snippet_actions = {
			-- Native Snippets
			snippet_forward = function()
				if vim.snippet.active({ direction = 1 }) then
					vim.schedule(function()
						vim.snippet.jump(1)
					end)
					return true
				end
			end,
			snippet_stop = function()
				if vim.snippet then
					vim.snippet.stop()
				end
			end,
		}

		local function map_action(actions, fallback)
			return function()
				for _, name in ipairs(actions) do
					if snippet_actions[name] then
						local ret = snippet_actions[name]()
						if ret then
							return true
						end
					end
				end
				return type(fallback) == "function" and fallback() or fallback
			end
		end

		-- add ai_accept to <Tab> key
		if not opts.keymap["<Tab>"] then
			if opts.keymap.preset == "super-tab" then -- super-tab
				opts.keymap["<Tab>"] = {
					require("blink.cmp.keymap.presets").get("super-tab")["<Tab>"][1],
					map_action({ "snippet_forward", "ai_nes", "ai_accept" }),
					"fallback",
				}
			else -- other presets
				opts.keymap["<Tab>"] = {
					map_action({ "snippet_forward", "ai_nes", "ai_accept" }),
					"fallback",
				}
			end
		end

		-- Unset custom prop to pass blink.cmp validation
		opts.sources.compat = nil

		local icons_kinds = {
			Array = " ",
			Boolean = "󰨙 ",
			Class = " ",
			Codeium = "󰘦 ",
			Color = " ",
			Control = " ",
			Collapsed = " ",
			Constant = "󰏿 ",
			Constructor = " ",
			Copilot = " ",
			Enum = " ",
			EnumMember = " ",
			Event = " ",
			Field = " ",
			File = " ",
			Folder = " ",
			Function = "󰊕 ",
			Interface = " ",
			Key = " ",
			Keyword = " ",
			Method = "󰊕 ",
			Module = " ",
			Namespace = "󰦮 ",
			Null = " ",
			Number = "󰎠 ",
			Object = " ",
			Operator = " ",
			Package = " ",
			Property = " ",
			Reference = " ",
			Snippet = "󱄽 ",
			String = " ",
			Struct = "󰆼 ",
			Supermaven = " ",
			TabNine = "󰏚 ",
			Text = " ",
			TypeParameter = " ",
			Unit = " ",
			Value = " ",
			Variable = "󰀫 ",
		}

		-- check if we need to override symbol kinds
		for _, provider in pairs(opts.sources.providers or {}) do
			---@cast provider blink.cmp.SourceProviderConfig|{kind?:string}
			if provider.kind then
				local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
				local kind_idx = #CompletionItemKind + 1

				CompletionItemKind[kind_idx] = provider.kind
				---@diagnostic disable-next-line: no-unknown
				CompletionItemKind[provider.kind] = kind_idx

				---@type fun(ctx: blink.cmp.Context, items: blink.cmp.CompletionItem[]): blink.cmp.CompletionItem[]
				local transform_items = provider.transform_items
				---@param ctx blink.cmp.Context
				---@param items blink.cmp.CompletionItem[]
				provider.transform_items = function(ctx, items)
					items = transform_items and transform_items(ctx, items) or items
					for _, item in ipairs(items) do
						item.kind = kind_idx or item.kind
						item.kind_icon = icons_kinds[item.kind_name] or item.kind_icon or nil
					end
					return items
				end

				-- Unset custom prop to pass blink.cmp validation
				provider.kind = nil
			end
		end

		require("blink.cmp").setup(opts)
	end,
}
