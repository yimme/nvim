return {
  cmd = function(dispatchers, config)
    -- Prefer the project-local oxfmt so the version matches the project's
    local cmd = 'oxfmt'
    local local_cmd = (config or {}).root_dir and config.root_dir .. '/node_modules/.bin/oxfmt'
    if local_cmd and vim.fn.executable(local_cmd) == 1 then
      cmd = local_cmd
    end
    return vim.lsp.rpc.start({ cmd, '--lsp' }, dispatchers)
  end,
  filetypes = {
    'javascript',
    'javascriptreact',
    'typescript',
    'typescriptreact',
    'vue',
    'json',
    'jsonc',
    'css',
    'scss',
    'graphql',
  },
  -- Only attach in projects that opt in to oxfmt, so prettier stays the default elsewhere
  root_dir = function(bufnr, on_dir)
    local root = vim.fs.root(bufnr, { '.oxfmtrc.json', '.oxfmtrc.jsonc', 'oxfmt.config.ts' })
    if root then
      on_dir(root)
    end
  end,
  -- The server requests this section via workspace/configuration and won't format without it
  settings = {
    oxc_language_server = vim.empty_dict(),
  },
}
