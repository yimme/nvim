return {
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      vim.keymap.set('n', '<leader>gp', ':Gitsigns preview_hunk<CR>', {})
    end,
  },

  {
    'FabijanZulj/blame.nvim',
    config = function()
      require('blame').setup()
    end,
  },

  { -- Neogit
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('neogit').setup {
        signs = {
          hunk = { '', '' },
          item = { '󰅂 ', '󰅀 ' },
          section = { '󰅂 ', '󰅀 ' },
        },
      }
      local neogit = require 'neogit'

      vim.keymap.set('n', '<leader>gs', neogit.open, { silent = true, noremap = true })
      vim.keymap.set('n', '<leader>gc', ':Neogit commit<CR>', { silent = true, noremap = true })
      vim.keymap.set('n', '<leader>gp', ':Neogit pull<CR>', { silent = true, noremap = true })
      vim.keymap.set('n', '<leader>gP', ':Neogit push<CR>', { silent = true, noremap = true })
      vim.keymap.set('n', '<leader>gb', ':Telescope git_branches<CR>', { silent = true, noremap = true })
      vim.keymap.set('n', '<leader>gB', ':G blame<CR>', { silent = true, noremap = true })
    end,
  },

  {
    'kdheepak/lazygit.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    keys = {
      {
        '<leader>lg',
        '<cmd>LazyGit<cr>',
        desc = 'LazyGit',
      },
    },
  },
}
