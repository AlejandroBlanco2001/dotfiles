return {
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    lazy = false,
    dependencies = { 'Saghen/blink.cmp' },
    config = function()
      vim.g.rustaceanvim = {
        server = {
          capabilities = require('blink.cmp').get_lsp_capabilities(),
          settings = {
            ['rust-analyzer'] = {
              checkOnSave = { command = "clippy" },
              cargo = { allFeatures = true },
            },
          },
        },
      }
    end,
  },

  {
    'Saghen/blink.cmp',
    version = '*',
    opts = {
      keymap = { preset = 'default' },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
    },
  },

  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        rust = { "rustfmt" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },

  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "rust", "toml" })
    end,
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
