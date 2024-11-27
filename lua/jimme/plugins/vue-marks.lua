return {
  dir = vim.fn.stdpath 'config' .. '/custom/vue-marks.lua',
  ft = { 'vue' },
  config = function()
    require 'custom.vue-marks'
  end,
}
