return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup {
        ui = {
          border = 'rounded',
        },
      }
      local ensure_installed = {
        'stylua',
        'rustfmt',
        'rustywind',
        'prettierd',
        'eslint_d',
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
}