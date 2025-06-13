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
        snacks = true,
      },
      term_colors = true,
      styles = {
        comments = { 'italic' },
        conditions = { 'italic' },
        types = { 'italic' },
        functions = { 'italic' },
      },
    }
    vim.cmd [[colorscheme catppuccin]]
  end,
}
