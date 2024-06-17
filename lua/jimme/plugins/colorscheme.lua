return {
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  'catppuccin/nvim',
  name = 'catpuccin',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    require('catppuccin').setup {
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = true,
        neogit = true,
        telescope = true,
        which_key = true,
      },
    }
  end,
  init = function()
    -- Load the colorscheme here.
    local hour = tonumber(os.date '%H')
    if hour >= 6 and hour < 12 then
      -- Dawn (6 AM - 12 PM)
      vim.cmd.colorscheme 'catppuccin-mocha'
    elseif hour >= 12 and hour < 18 then
      -- Noon (12 PM - 6 PM)
      vim.cmd.colorscheme 'catppuccin-mocha'
    elseif hour >= 18 and hour < 21 then
      -- Dusk (6 PM - 9 PM)
      vim.cmd.colorscheme 'catppuccin-mocha'
    else
      -- Night (9 PM - 6 AM)
      vim.cmd.colorscheme 'catppuccin-mocha'
    end

    -- You can configure highlights by doing something like:
    vim.cmd.hi 'Comment gui=none'
  end,
}
