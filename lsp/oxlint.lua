return {
  cmd = function(dispatchers, config)
    -- Prefer the project-local oxlint so the version (and rule set) matches the project's
    local cmd = 'oxlint'
    local local_cmd = (config or {}).root_dir and config.root_dir .. '/node_modules/.bin/oxlint'
    if local_cmd and vim.fn.executable(local_cmd) == 1 then
      cmd = local_cmd
    end
    return vim.lsp.rpc.start({ cmd, '--lsp' }, dispatchers)
  end,
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue' },
  -- Root at the oxlint config so monorepos use the root's oxlint, not a workspace package's
  root_dir = function(bufnr, on_dir)
    on_dir(vim.fs.root(bufnr, '.oxlintrc.json') or vim.fs.root(bufnr, { 'package.json', '.git' }))
  end,
}
