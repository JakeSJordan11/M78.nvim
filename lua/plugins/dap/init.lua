return {
  {
    'mfussenegger/nvim-dap',
    config = function()
      vim.api.nvim_set_keymap('n', '<F8>', [[:lua require"dap".toggle_breakpoint()<CR>]], { noremap = true })
      vim.api.nvim_set_keymap('n', '<F9>', [[:lua require"dap".continue()<CR>]], { noremap = true })
      vim.api.nvim_set_keymap('n', '<F10>', [[:lua require"dap".step_over()<CR>]], { noremap = true })
      vim.api.nvim_set_keymap('n', '<S-F10>', [[:lua require"dap".step_into()<CR>]], { noremap = true })
      vim.api.nvim_set_keymap('n', '<F12>', [[:lua require"dap.ui.widgets".hover()<CR>]], { noremap = true })
      vim.api.nvim_set_keymap('n', '<F5>', [[:lua require"osv".launch({port = 8086})<CR>]], { noremap = true })
    end,
    dependencies = {
      'jbyuki/one-small-step-for-vimkind',
      'jayp0521/mason-nvim-dap.nvim',
      'theHamsta/nvim-dap-virtual-text',
      'rcarriga/nvim-dap-ui',
    },
  },
  {
    'jayp0521/mason-nvim-dap.nvim',
    opts = function()
      require("mason-nvim-dap").setup({
        ensure_installed = { 'node2', 'chrome', 'firefox' },
        automatic_setup = true,
      })
      require 'mason-nvim-dap'.setup_handlers()
    end
  },
  {
    'jbyuki/one-small-step-for-vimkind',
    config = function()
      local dap = require 'dap'
      dap.configurations.lua = {
        {
          type = 'nlua',
          request = 'attach',
          name = "Attach to running Neovim instance",
        }
      }

      dap.adapters.nlua = function(callback, config)
        callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 8086 })
      end
    end
  }
}
