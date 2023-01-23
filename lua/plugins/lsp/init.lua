return {
  {
    'neovim/nvim-lspconfig',
    event = 'BufReadPre',
    dependencies = {
      { 'folke/neodev.nvim', config = true },
      'simrat39/rust-tools.nvim',
      'rust-lang/rust.vim',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'jose-elias-alvarez/typescript.nvim',
      {
        'folke/trouble.nvim',
        config = function()
          local wk = require 'which-key'
          wk.register {
            ['<leader>x'] = {
              name = 'Trouble',
              x = { '<cmd>TroubleToggle<cr>', 'Toggle' },
              w = { '<cmd>Trouble workspace_diagnostics<cr>', 'Workspace Diagnostics' },
              d = { '<cmd>Trouble document_diagnostics<cr>', 'Document Diagnostics' },
              l = { '<cmd>Trouble loclist<cr>', 'Loclist' },
              q = { '<cmd>Trouble quickfix<cr>', 'Quickfix' },
              r = { '<cmd>Trouble lsp_references<cr>', 'References' },
            },
          }
          require('trouble').setup()
        end,
      },
    },
    config = function(plugin)
      require('plugins.lsp.servers').setup(plugin)
    end,
  },
}
