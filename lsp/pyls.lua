local lspconfig = require 'lspconfig'

lspconfig.pyls.setup {
  cmd = { 'pyls' },
  filetypes = { 'python' },
  root_dir = lspconfig.util.root_pattern('pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', '.git'),
  settings = {
    pyls = {
      plugins = {
        pycodestyle = { enabled = true },
        flake8 = { enabled = false }, -- optional
        mccabe = { enabled = true },
        pylint = { enabled = false }, -- optional
        yapf = { enabled = false },
        black = { enabled = true }, -- enables Black formatter
      },
    },
  },
  on_attach = function(client, bufnr)
    -- Optional: format on save
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function()
      vim.lsp.buf.format { bufnr = bufnr }
    end, { desc = 'Format current buffer' })

    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format { bufnr = bufnr }
      end,
    })
  end,
}
