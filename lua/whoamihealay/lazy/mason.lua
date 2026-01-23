return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"ansiblels",
			"azure_pipelines_ls",
			"dockerls",
			"docker_compose_language_service",
			"helm_ls",
			"jsonls",
			"lua_ls",
			"stylua",
			"tailwindcss",
			"terraformls",
			"tflint",
			"vtsls",
			"yamlls",
		},
	},
	dependencies = {
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
				keymaps = {
					-- Keymap to expand a package
					toggle_package_expand = "<CR>",
					-- Keymap to install the package under the current cursor position
					install_package = "i",
					-- Keymap to reinstall/update the package under the current cursor position
					update_package = "u",
					-- Keymap to check for new version for the package under the current cursor position
					check_package_version = "c",
					-- Keymap to update all installed packages
					update_all_packages = "U",
					-- Keymap to check which installed packages are outdated
					check_outdated_packages = "C",
					-- Keymap to uninstall a package
					uninstall_package = "X",
					-- Keymap to cancel a package installation
					cancel_installation = "<C-c>",
					-- Keymap to apply language filter
					apply_language_filter = "<C-f>",
					-- Keymap to toggle viewing package installation log
					toggle_package_install_log = "<CR>",
					-- Keymap to toggle the help view
					toggle_help = "g?",
				},
			},
		},
		"neovim/nvim-lspconfig",
	},
}
