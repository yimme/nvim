vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true

vim.opt.splitright = true -- open new splits on the right

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.clipboard = 'unnamedplus'

vim.opt.termguicolors = true

vim.g.have_nerd_font = true
vim.opt.showmode = false -- Hide mode because already in lualine

vim.opt.scrolloff = 10 -- lines before scroll

vim.opt.list = true -- Show list chars
vim.opt.listchars = {
  tab = '→ ',
  space = '·',
}

vim.diagnostic.config {
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
}

local augroup = vim.api.nvim_create_augroup('lsp_attach_keymaps', { clear = true })

vim.api.nvim_create_autocmd('LspAttach', {
  group = augroup,
  callback = function(event)
    local buf = event.buf
    local map = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = buf, desc = 'LSP: ' .. desc })
    end

    map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
    map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
    map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    map('K', vim.lsp.buf.hover, 'Hover Documentation')
    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  end,
})
