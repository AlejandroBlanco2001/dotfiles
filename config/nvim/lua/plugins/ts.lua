return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ts_ls = {},
        eslint = {
          on_attach = function(_, bufnr)
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              command = "EslintFixAll",
            })
          end,
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript      = { "prettier" },
        javascriptreact = { "prettier" },
        typescript      = { "prettier" },
        typescriptreact = { "prettier" },
        json            = { "prettier" },
        css             = { "prettier" },
        html            = { "prettier" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "javascript",
        "typescript",
        "tsx",
        "json",
        "html",
        "css",
      })
    end,
  },

  -- Jest test runner integration
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "marilari88/neotest-jest",
    },
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}
      table.insert(opts.adapters, require("neotest-jest")({
        jestCommand = "npx jest",
        jestConfigFile = "jest.config.ts",
        env = { CI = "true" },
        cwd = function()
          return vim.fn.getcwd()
        end,
      }))
    end,
    keys = {
      { "<leader>tt", function() require("neotest").run.run() end,                desc = "Run nearest test" },
      { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run file tests" },
      { "<leader>ts", function() require("neotest").summary.toggle() end,          desc = "Test summary" },
      { "<leader>to", function() require("neotest").output_panel.toggle() end,     desc = "Test output" },
    },
  },
}
