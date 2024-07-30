return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    -- Keybinds
    vim.api.nvim_set_keymap('n', '<leader>et', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>ee', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>eo', ':wincmd l<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>er', ':NvimTreeRefresh<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>ef', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })

    require('nvim-tree').setup {
      git = {
        enable = true,
        ignore = false,
        timeout = 500,
      },
      filters = {
        enable = true,
        custom = { '.DS_Store' },
      },
    }
  end,
}
