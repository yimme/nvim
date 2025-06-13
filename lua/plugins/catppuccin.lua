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
        gitsigns = true,
        treesitter = true,
        snacks = true,
        indent_blankline = {
          enabled = true,
          scope_color = 'yellow',
          colored_indent_levels = false,
        },
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
