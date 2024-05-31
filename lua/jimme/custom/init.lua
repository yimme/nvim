-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  vim.api.nvim_set_keymap('n', '<leader>bj', ':bprevious<CR>', { noremap = true, silent = true }),
  vim.api.nvim_set_keymap('n', '<leader>bk', ':bnext<CR>', { noremap = true, silent = true }),
}
