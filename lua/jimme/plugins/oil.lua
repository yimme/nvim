return {
  'stevearc/oil.nvim',
  dependencies = {
    {
      'echasnovski/mini.icons',
      opts = {},
    },
  },
  config = function()
    require('oil').setup {
      view_options = {
        show_hidden = true,
      },
    }

    -- Open parent directory in current window
    vim.keymap.set('n', '<space>-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

    -- Open parent directory in floating window
    vim.keymap.set('n', '-', require('oil').toggle_float)
  end,
}
