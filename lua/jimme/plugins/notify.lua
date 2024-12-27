return {
  'rcarriga/nvim-notify',
  config = function()
    require('notify').setup {
      background_colour = 'NotifyBackground',
      render = 'wrapped-compact',
      level = vim.log.levels.WARN,
      timeout = 2000,
    }
    vim.notify = require 'notify'
  end,
}
