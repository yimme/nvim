return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').install { 'vue', 'go', 'typescript', 'javascript', 'lua', 'graphql', 'css', 'scss', 'python' }

      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'vue', 'go', 'python' },
        group = vim.api.nvim_create_augroup('treesitter_setup', { clear = true }),
        callback = function(args)
          local buf = args.buf
          local filetype = args.match
          local language = vim.treesitter.language.get_lang(filetype) or filetype

          if not vim.treesitter.language.add(language) then
            return
          end

          vim.treesitter.start(buf, language)

          vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })

      local function incremental_selection()
        local ts_utils = require 'nvim-treesitter.ts_utils'
        local node = ts_utils.get_node_at_cursor()
        if not node then
          return
        end
        local start_row, start_col, end_row, end_col = node:range()
        vim.api.nvim_buf_set_mark(0, '<', start_row + 1, start_col, {})
        vim.api.nvim_buf_set_mark(0, '>', end_row + 1, end_col, {})
        vim.cmd 'normal! v'
        vim.cmd 'normal! `<v`>'
      end

      vim.keymap.set('n', 'gnn', incremental_selection, { desc = 'Start incremental selection' })
    end,
  },
}
