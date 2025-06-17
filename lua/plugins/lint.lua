return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  keys = {
    {
      '<leader>l',
      function()
        require('lint').try_lint()
      end,
      desc = 'Trigger linting for current buffer',
    },
  },
  config = function()
    vim.env.ESLINT_D_PPID = vim.fn.getpid()

    local lint = require 'lint'

    lint.linters_by_ft = {
      javascript = { 'eslint_d' },
      javascriptreact = { 'eslint_d' },
      typescript = { 'oxlint', 'eslint_d' },
      typescriptreact = { 'eslint_d' },
      vue = { 'oxlint', 'eslint_d' },
      python = { 'flake8' },
    }

    -- Auto-lint on save
    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave', 'TextChanged' }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
