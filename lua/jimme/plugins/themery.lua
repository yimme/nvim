return {
  'zaldih/themery.nvim',
  lazy = false,
  config = function()
    require('themery').setup {
      -- add the config here
      themes = { 'catppuccin', 'gruvbox' },
    }
  end,
}
