return {
  cmd = { 'emmet-ls', '--stdio' },
  filetypes = { 'html', 'css', 'scss', 'vue' },
  init_options = {
    html = {
      options = {
        ['bem_enabled'] = true,
      },
    },
    includeLanguages = {
      vue = 'html',
    },
  },
}
