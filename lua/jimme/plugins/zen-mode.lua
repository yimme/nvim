return {
  'folke/zen-mode.nvim',
  opts = {
    window = {
      width = 140,
    },
  },
  keys = {
    { '<leader>z', ':ZenMode<CR>', desc = 'Toggle zen mode' },
  },
}
