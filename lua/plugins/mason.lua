return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup {
        ui = {
          border = 'rounded',
          height = 0.8,
        },
      }

      local ensure_installed = {
        'stylua',
        'rustfmt',
        'prettierd',
        -- 'typescript-language-server',
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
}
