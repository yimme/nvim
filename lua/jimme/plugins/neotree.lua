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
    vim.api.nvim_set_keymap('n', '<leader>et', ':Neotree toggle<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>ee', ':Neotree focus<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>er', ':Neotree refresh<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>eo', ':wincmd p<CR>', { noremap = true, silent = true })

    require('neo-tree').setup {
      open_on_setup = false,
      open_on_setup_file = false,
      open_on_tab_enter = false,

      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    }
  end,
}
