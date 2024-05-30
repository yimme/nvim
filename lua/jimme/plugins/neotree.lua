return {
  -- Neo tree
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    -- Custom keybinds
    vim.api.nvim_set_keymap('n', '<leader>b', ':Neotree toggle right<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>e', ':Neotree focus<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>r', ':Neotree refresh<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>o', ':wincmd p<CR>', { noremap = true, silent = true })

    require('neo-tree').setup {
      open_on_setup = false,
      open_on_setup_file = false,
      open_on_tab_enter = false,
    }
  end,
}
