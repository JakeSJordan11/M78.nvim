return {
  {
    'folke/tokyonight.nvim',
    event = 'VeryLazy',
    priority = 1000,
  },
  {
    'catppuccin/nvim',
    event = 'VeryLazy',
    name = 'catppuccin',
    priority = 1000,
  },
  {
    'savq/melange-nvim',
    event = 'VeryLazy',
    priority = 1000,
  },
  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      local gruvbox = require 'gruvbox'
      require('gruvbox').setup {
        overrides = {
          SignColumn = { bg = 'NONE' },
          Pmenu = { bg = 'NONE' },
          GruvboxGreenSign = { bg = 'NONE' },
          GruvboxAquaSign = { bg = 'NONE' },
          GruvboxOrangeSign = { bg = 'NONE' },
          GruvboxRedSign = { bg = 'NONE' },
          GruvboxBlueSign = { bg = 'NONE' },
          GruvboxPurpleSign = { bg = 'NONE' },
          GruvboxYellowSign = { bg = 'NONE' },
          IncSearch = { bg = '#484848' }
        },
      }
      gruvbox.load()
    end,
  },
}
