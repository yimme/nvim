return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    vim.env.ESLINT_D_PPID = vim.fn.getpid()
    local lint = require 'lint'

    local eslint_config_files = {
      'eslint.config.js',
      'eslint.config.mjs',
      'eslint.config.cjs',
      '.eslintrc.js',
      '.eslintrc.cjs',
      '.eslintrc.json',
      '.eslintrc.yaml',
      '.eslintrc.yml',
    }

    local function has_eslint_config(bufnr)
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      local path = vim.fs.dirname(bufname)
      return #vim.fs.find(eslint_config_files, { upward = true, path = path, type = 'file' }) > 0
    end

    local eslint_fts = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue' }

    lint.linters_by_ft = {
      -- go = { 'golangcilint' },
    }

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        local ft = vim.bo[bufnr].filetype
        if vim.tbl_contains(eslint_fts, ft) and has_eslint_config(bufnr) then
          lint.try_lint { 'eslint_d' }
        else
          lint.try_lint()
        end
      end,
    })
  end,
}
