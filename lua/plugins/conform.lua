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

      -- Use the oxfmt LSP when it's attached (project has an oxfmt config), otherwise prettierd
      local function js_formatters(bufnr)
        if #vim.lsp.get_clients { bufnr = bufnr, name = 'oxfmt' } > 0 then
          return { 'eslint_d', lsp_format = 'last', name = 'oxfmt' }
        end
        return { 'eslint_d', 'prettierd' }
      end

      require('conform').setup {
        format_on_save = {
          timeout_ms = 1000,
          lsp_fallback = true,
        },
        formatters_by_ft = {
          lua = { 'stylua' },
          vue = js_formatters,
          typescript = js_formatters,
          javascript = js_formatters,
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
