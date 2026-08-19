return {
  -- 1. Managing Rust tools smoothly
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    lazy = false, -- This plugin handles its own lazy loading
    dependencies = { 'Saghen/blink.cmp' },
    config = function()
      vim.g.rustaceanvim = {
        server = {
          capabilities = require('blink.cmp').get_lsp_capabilities(),
        },
      }
    end,
  },

  -- 2. Lightning-fast auto-completion engine
  {
    'Saghen/blink.cmp',
    version = '*',                     -- Use latest stable release
    opts = {
      keymap = { preset = 'default' }, -- Ctrl+n/Ctrl+p to navigate, Enter/Ctrl+y to confirm
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
    },
  },
  {
    'folke/trouble.nvim',
    opts = {},
    cmd = 'Trouble',
    keys = {
      { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics' },
    },
  },
}
