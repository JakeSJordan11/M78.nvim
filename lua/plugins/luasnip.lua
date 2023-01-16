return {
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'rafamadriz/friendly-snippets',
      config = function()
        require('luasnip.loaders.from_vscode').lazy_load()
      end,
    },
    config = {
      history = true,
      delete_check_events = 'TextChanged',
    },
    keys = {
      {
        '<C-n>',
        function()
          return require('luasnip').jumpable(1) and '<Plug>luasnip-jump-next' or '<tab>'
        end,
        expr = true,
        remap = true,
        silent = true,
        mode = 'i',
      },
      {
        '<C-n>',
        function()
          require('luasnip').jump(1)
        end,
        mode = 's',
      },
      {
        '<C-p>',
        function()
          require('luasnip').jump(-1)
        end,
        mode = { 'i', 's' },
      },
    },
  },
}
