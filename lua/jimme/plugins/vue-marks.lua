return {
  'yimme/vue-marks.nvim',
  ft = { 'vue' },
  config = function()
    require('vue-marks').setup()
  end,
}
