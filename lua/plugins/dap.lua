return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'jbyuki/one-small-step-for-vimkind',
      'jayp0521/mason-nvim-dap.nvim',
      'theHamsta/nvim-dap-virtual-text',
      'rcarriga/nvim-dap-ui',
      'williamboman/mason.nvim',
      'jayp0521/mason-nvim-dap.nvim',
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

      dap.configurations.lua = {
        {
          type = 'nlua',
          request = 'attach',
          name = 'Attach to running Neovim instance',
        },
      }

      dap.adapters.nlua = function(callback, config)
        callback { type = 'server', host = config.host or '127.0.0.1', port = config.port or 8086 }
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
