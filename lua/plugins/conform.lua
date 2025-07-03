return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    config = function()
      local function has_eslint_config(bufname)
        local path = vim.fs.dirname(bufname)
        local config_files = {
          'eslint.config.js',
          'eslint.config.mjs',
          'eslint.config.cjs',
          '.eslintrc.js',
          '.eslintrc.cjs',
          '.eslintrc.json',
          '.eslintrc.yaml',
          '.eslintrc.yml',
        }

        local found = vim.fs.find(config_files, { upward = true, path = path, type = 'file' })
        return #found > 0
      end

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
          go = { 'gofmt' },
        },
        formatters = {
          eslint_d = {
            condition = function(ctx)
              return has_eslint_config(ctx.filename)
            end,
          },
        },
      }
    end,
  },
}
