return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'echasnovski/mini.icons',
  },
  config = function()
    require('lualine').setup {
      options = {
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_c = { 'filename' },
      },
    }
  end,
}
