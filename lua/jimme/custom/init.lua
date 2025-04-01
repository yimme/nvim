-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  vim.api.nvim_set_keymap('n', '<leader>bp', ':bprevious<CR>', { noremap = true, silent = true }),
  vim.api.nvim_set_keymap('n', '<leader>bn', ':bnext<CR>', { noremap = true, silent = true }),

  -- Remap Ctrl-e to increment the number (same as Ctrl-a) in both normal and visual mode
  vim.api.nvim_set_keymap('n', '<C-e>', '<C-a>', { noremap = true, silent = true }),
  vim.api.nvim_set_keymap('v', '<C-e>', '<C-a>', { noremap = true, silent = true }),
}
