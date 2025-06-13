return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' },
  config = function()
    require('nvim-treesitter').setup {
      highlight = { enable = true },
      auto_install = true,
      ensure_installed = { 'vue', 'html', 'css', 'lua' },
    }
  end,
}
