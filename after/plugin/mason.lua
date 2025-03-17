require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = {'eslint', 'lua_ls', 'rust_analyzer', 'dockerls', 'ansiblels', 'helm_ls', 'jsonls'},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  }
})
