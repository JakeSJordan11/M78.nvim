return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'jayp0521/mason-nvim-dap.nvim',
      'theHamsta/nvim-dap-virtual-text',
      'rcarriga/nvim-dap-ui',
      'williamboman/mason.nvim',
      'jayp0521/mason-nvim-dap.nvim',
      'nvim-telescope/telescope-dap.nvim',
      'jbyuki/one-small-step-for-vimkind',
      'mxsdev/nvim-dap-vscode-js',
      'microsoft/vscode-js-debug',
    },
    config = function()
      local wk = require 'which-key'
      local dap = require 'dap'
      wk.register {
        ['<Leader>d'] = {
          name = 'Debug',
          b = { dap.toggle_breakpoint, 'Toggle Breakpoint' },
          c = { dap.continue, 'Continue' },
          i = { dap.step_into, 'Step Into' },
          o = { dap.step_out, 'Step Out' },
          O = { dap.step_over, 'Step Over' },
          r = { dap.repl.open, 'Open REPL' },
          s = { dap.continue, 'Start' },
          S = { dap.stop, 'Stop' },
        },
      }

      for _, language in ipairs { 'typescriptreact', 'javascriptreact' } do
        require('dap').configurations[language] = {
          {
            type = 'pwa-chrome',
            name = 'Attach - Remote Debugging',
            request = 'attach',
            program = '${file}',
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
            protocol = 'inspector',
            port = 9222,
            webRoot = '${workspaceFolder}',
          },
          {
            type = 'pwa-chrome',
            name = 'Launch Chrome',
            request = 'launch',
            url = 'http://localhost:3000',
          },
        }
      end
    end,
  },
  {
    'jayp0521/mason-nvim-dap.nvim',
    opts = function()
      require('mason-nvim-dap').setup {
        ensure_installed = { 'node2', 'chrome', 'firefox' },
        automatic_setup = true,
      }
      require('mason-nvim-dap').setup_handlers()
    end,
  },
}
