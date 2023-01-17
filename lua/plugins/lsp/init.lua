return {
  {
    'neovim/nvim-lspconfig',
    event = 'BufReadPre',
    dependencies = {
      { 'folke/neoconf.nvim', cmd = 'Neoconf', config = true },
      { 'folke/neodev.nvim', config = true },
      { 'j-hui/fidget.nvim', config = true },
      { 'smjonas/inc-rename.nvim', config = true },
      'simrat39/rust-tools.nvim',
      'rust-lang/rust.vim',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'jose-elias-alvarez/typescript.nvim',
    },
    config = function(plugin)
      require('plugins.lsp.servers').setup(plugin)
    end,
  },
  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    keys = { { '<Leader>m', '<Cmd>Mason<cr>', desc = 'Mason' } },
    config = function()
      require('mason').setup()
      local ensure_installed = {
        'stylua',
        'ruff',
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
  {
    'jose-elias-alvarez/null-ls.nvim',
    event = 'BufReadPre',
    dependencies = { 'mason.nvim' },
    config = function()
      local nls = require 'null-ls'
      nls.setup {
        sources = {
          nls.builtins.formatting.stylua,
          -- nls.builtins.diagnostics.ruff.with { extra_args = { '--max-line-length=180' } },
        },
      }
    end,
  },
  {
    'utilyre/barbecue.nvim',
    event = 'VeryLazy',
    dependencies = {
      'neovim/nvim-lspconfig',
      'SmiteshP/nvim-navic',
      'nvim-tree/nvim-web-devicons',
    },
    config = true,
  },
}
