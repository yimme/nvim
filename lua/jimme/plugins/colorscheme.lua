return {
  'catppuccin/nvim',
  name = 'catpuccin',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    require('catppuccin').setup {
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        grug_far = true,
        notify = true,
        neogit = true,
        telescope = true,
        which_key = true,
        mason = true,
        noice = true,
      },
      term_colors = true,
      styles = {
        comments = { 'italic' },
        conditions = { 'italic' },
        types = { 'italic' },
        functions = { 'italic' },
      },
      flavour = 'mocha',
      background = {
        light = 'latte',
        dark = 'mocha',
      },
    }
  end,
  init = function()
    -- Load the colorscheme here.
    vim.cmd.colorscheme 'catppuccin'

    -- You can configure highlights by doing something like:
    vim.cmd.hi 'Comment gui=none'
  end,
}
