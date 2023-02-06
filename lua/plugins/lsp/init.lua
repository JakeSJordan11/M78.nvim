return {
  {
    'neovim/nvim-lspconfig',
    event = 'BufReadPre',
    dependencies = {
      { 'folke/neodev.nvim', config = true },
      {
        'williamboman/mason.nvim',
        dependencies = {
          'williamboman/mason-lspconfig.nvim',
        },
        config = function()
          require('mason').setup {
            ui = {
              border = 'rounded',
              height = 0.8,
            },
          }

          local ensure_installed = {
            'stylua',
            -- 'rustfmt',
            'prettierd',
            'typescript-language-server',
          }
          local mr = require 'mason-registry'
          for _, tool in ipairs(ensure_installed) do
            local p = mr.get_package(tool)
            if not p:is_installed() then
              p:install()
            end
          end
          local wk = require 'which-key'
          wk.register {
            ['<Leader>m'] = { '<Cmd>Mason<CR>', 'Mason' },
          }
        end,
      },
      'simrat39/rust-tools.nvim',
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
