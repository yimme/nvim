pcall(require, 'nvim-treesitter')
return {
  'nvim-telescope/telescope.nvim',
  branch = 'master',
  dependencies = { 'nvim-lua/plenary.nvim' },
  enabled = false,
  keys = {
    { '<leader>sf', '<cmd>Telescope find_files<cr>', { Desc = 'Search Files' } },
    { '<leader>sd', '<cmd>Telescope diagnostics<cr>', { Desc = 'Search Diagnostics' } },
    { '<leader>sg', '<cmd>Telescope live_grep<cr>', { Desc = 'Search Grep' } },
  },
}
