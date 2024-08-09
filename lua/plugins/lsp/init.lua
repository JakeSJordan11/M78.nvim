return {
  {
    'neovim/nvim-lspconfig',
    event = 'BufReadPre',
    dependencies = {
      'jose-elias-alvarez/typescript.nvim',
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
            'typescript-language-server',
            'prettier',
          }
          local mr = require 'mason-registry'
          for _, tool in ipairs(ensure_installed) do
            local p = mr.get_package(tool)
            if not p:is_installed() then
              p:install()
            end
          end
        end,
      },
      {
        'jose-elias-alvarez/null-ls.nvim',
        event = 'BufReadPre',
        config = function()
          local nls = require 'null-ls'
          nls.setup {
            sources = {
              nls.builtins.formatting.stylua,
              nls.builtins.formatting.prettier,
            },
          }
        end,
      },
    },
    config = function(plugin)
      require('plugins.lsp.servers').setup(plugin)
    end,
  },
}
