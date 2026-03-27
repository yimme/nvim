local ensure_installed = { 'lua_ls', 'vue_ls', 'vtsls', 'cssls', 'gopls', 'emmet_ls', 'ty', 'postgres-language-server' }

return {
  'mason-org/mason-lspconfig.nvim',
  opts = {
    ensure_installed = ensure_installed,
    automatic_enable = {
      exclude = { 'vtsls', 'vue_ls' },
    },
  },
  dependencies = {
    { 'mason-org/mason.nvim', opts = {
      ensure_installed = { 'eslint_d', 'prettierd', 'autopep8' },
    } },
  },
}
