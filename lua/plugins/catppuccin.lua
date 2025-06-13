return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      integrations = {
        cmp = true,
        mason = true,
        telescope = true,
        treesitter = true,
      },
      term_colors = true,
    }
    vim.cmd [[colorscheme catppuccin]]
  end,
}
