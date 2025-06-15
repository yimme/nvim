<<<<<<< Updated upstream
local ensure_installed = { 'lua_ls', 'vue_ls@3.0.0-alpha.10', 'vtsls', 'cssls', 'gopls', 'pyright' }
=======
local ensure_installed = { 'lua_ls', 'vue_ls@3.0.0-beta.1', 'vtsls', 'cssls', 'gopls' }
>>>>>>> Stashed changes

return {
  'mason-org/mason-lspconfig.nvim',
  opts = {
    ensure_installed = ensure_installed,
    automatic_enable = {
      exclude = { 'vue_ls', 'vtsls' },
    },
  },
  dependencies = {
    { 'mason-org/mason.nvim', opts = {
      ensure_installed = { 'eslint_d', 'prettierd', 'autopep8', 'flake8', 'oxlint' },
    } },
    -- { 'neovim/nvim-lspconfig' },
  },
}
