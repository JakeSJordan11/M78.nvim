return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    --[[ config = function()
      local tokyonight = require 'tokyonight'
      tokyonight.setup { style = 'storm' }
      tokyonight.load()
    end, ]]
  },
  {
    'catppuccin/nvim',
    lazy = false,
    name = 'catppuccin',
    priority = 1000,
  },
  {
    'savq/melange-nvim',
    lazy = false,
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
          CursorLine = { bg = 'NONE' },
          CursorLineNr = { bg = 'NONE' },
          Pmenu = { bg = 'NONE' },
          GruvboxGreenSign = { bg = 'NONE' },
          GruvboxAquaSign = { bg = 'NONE' },
          GruvboxOrangeSign = { bg = 'NONE' },
          GruvboxRedSign = { bg = 'NONE' },
          GruvboxBlueSign = { bg = 'NONE' },
          GruvboxPurpleSign = { bg = 'NONE' },
          GruvboxYellowSign = { bg = 'NONE' },
        },
      }
      gruvbox.load()
    end,
  },
}
