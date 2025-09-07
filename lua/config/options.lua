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
vim.opt.cmdheight = 0 -- hide the whole bar

vim.opt.scrolloff = 10 -- lines before scroll

vim.opt.list = true -- Show list chars
vim.opt.listchars = {
  tab = '┃ ',
  space = '·',
}

vim.diagnostic.config {
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
}

-- Show command line when recording a macro
vim.api.nvim_create_autocmd('RecordingEnter', {
  callback = function()
    vim.opt.cmdheight = 1
  end,
})
vim.api.nvim_create_autocmd('RecordingLeave', {
  callback = function()
    vim.opt.cmdheight = 0
  end,
})

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { noremap = true, silent = true })

local augroup = vim.api.nvim_create_augroup('lsp_attach_keymaps', { clear = true })

vim.api.nvim_create_autocmd('LspAttach', {
  group = augroup,
  callback = function(event)
    local buf = event.buf
    local map = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = buf, desc = 'LSP: ' .. desc })
    end

    map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    map('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
    map('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    map('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    map('<leader>ds', vim.lsp.buf.document_symbol, '[D]ocument [S]ymbols')
    map('<leader>ws', vim.lsp.buf.workspace_symbol, '[W]orkspace [S]ymbols')
    map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    map('K', vim.lsp.buf.hover, 'Hover Documentation')
    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank {
      higroup = 'IncSearch',
      timeout = 200,
    }
  end,
})
