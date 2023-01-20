return {
  {
    'neovim/nvim-lspconfig',
    event = 'BufReadPre',
    dependencies = {
      { 'folke/neodev.nvim', config = true },
      -- { 'j-hui/fidget.nvim', config = true },
      'simrat39/rust-tools.nvim',
      'rust-lang/rust.vim',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'jose-elias-alvarez/typescript.nvim',
      'windwp/windline.nvim',
    },
    config = function(plugin)
      require('plugins.lsp.servers').setup(plugin)
    end,
  },
}
