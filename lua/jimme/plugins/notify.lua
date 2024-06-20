return {
  'rcarriga/nvim-notify',
  config = function()
    require('notify').setup {
      background_colour = 'NotifyBackground',
      render = 'wrapped-compact',
    }
    vim.notify = require 'notify'
  end,
}
