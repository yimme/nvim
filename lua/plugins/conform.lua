return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    config = function()
      require('conform').setup {
        format_on_save = {
          timeout_ms = 1000,
          lsp_fallback = true,
        },
        formatters_by_ft = {
          lua = { 'stylua' },
          vue = { 'eslint_d', 'prettierd' },
          typescript = { 'eslint_d', 'prettierd' },
          javascript = { 'eslint_d', 'prettierd' },
          python = { 'autopep8' },
        },
      }
    end,
  },
}
