return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>sf', '<cmd>Telescope find_files<cr>', { Desc = 'Search Files' } },
    { '<leader>sd', '<cmd>Telescope diagnostics<cr>', { Desc = 'Search Diagnostics' } },
    { '<leader>sg', '<cmd>Telescope live_grep<cr>', { Desc = 'Search Grep' } },
  },
}
