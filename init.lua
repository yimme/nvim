require 'config.lazy'
require 'config.options'
require 'config.keymaps'

vim.lsp.enable { 'vtsls', 'gopls', 'ty', 'oxlint' }
