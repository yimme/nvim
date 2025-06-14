return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
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
    vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
