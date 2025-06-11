local ensure_installed = { 'lua_ls', 'vue_ls', 'vtsls' }

return {
  'mason-org/mason-lspconfig.nvim',
  opts = {
    ensure_installed = ensure_installed,
  },
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'neovim/nvim-lspconfig',
  },
}
