return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'jbyuki/one-small-step-for-vimkind',
      'jayp0521/mason-nvim-dap.nvim',
      'theHamsta/nvim-dap-virtual-text',
      'rcarriga/nvim-dap-ui',
    },
    config = function()
      vim.keymap.set('n', '<Leader>dc', "<Cmd>lua require'dap'.continue()<CR>")
      vim.keymap.set('n', '<Leader>do', "<Cmd>lua require'dap'.step_over()<CR>")
      vim.keymap.set('n', '<Leader>di', "<Cmd>lua require'dap'.step_into()<CR>")
      vim.keymap.set('n', '<Leader>du', "<Cmd>lua require'dap'.step_out()<CR>")
      vim.keymap.set('n', '<Leader>db', "<Cmd>lua require'dap'.toggle_breakpoint()<CR>")
      vim.keymap.set('n', '<Leader>dr', "<Cmd>lua require'dap'.repl.open()<CR>")
      vim.keymap.set('n', '<Leader>dd', "<Cmd>lua require'osv'.run_this()<CR>")

      local dap = require 'dap'
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
