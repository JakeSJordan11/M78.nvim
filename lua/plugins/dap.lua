return {
  'mfussenegger/nvim-dap',
  event = 'VeryLazy',
  dependencies = {
    {
      'jay-babu/mason-nvim-dap.nvim',
      config = function()
        require('mason-nvim-dap').setup {
          ensure_installed = nil,
          automatic_installation = true,
          automatic_setup = false,
        }
      end,
    },
    {
      'theHamsta/nvim-dap-virtual-text',
      config = function()
        require('nvim-dap-virtual-text').setup {}
      end,
    },
    {
      'rcarriga/nvim-dap-ui',
      config = function()
        require('dapui').setup {}
      end,
    },
    'mxsdev/nvim-dap-vscode-js',
  },
}
