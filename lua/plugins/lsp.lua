local ensure_installed = { 'lua_ls', 'vue_ls@3.0.0-alpha.10', 'vtsls', 'cssls' }

return {
  'mason-org/mason-lspconfig.nvim',
  opts = {
    ensure_installed = ensure_installed,
    automatic_enable = { 'lua_ls' },
  },
  dependencies = {
    { 'mason-org/mason.nvim', opts = {
      ensure_installed = { 'eslint_d', 'prettierd' },
    } },
    -- { 'neovim/nvim-lspconfig' },
  },
}
