return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff = {
          -- Disable hover; ty handles type info
          on_attach = function(client)
            client.server_capabilities.hoverProvider = false
          end,
        },
        ty = {},
        pyright = { enabled = false },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_organize_imports", "ruff_format" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters = {
        ruff_format = {
          prepend_args = { "--line-length", "88" },
        },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "python" })
    end,
  },
}
