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
          DiagnosticSignInfo = { bg = 'NONE', fg = 'LightBlue' },
          DiagnosticSignHint = { bg = 'NONE', fg = 'LightGrey' },
          DiagnosticSignWarn = { bg = 'NONE', fg = 'Orange' },
          DiagnosticSignError = { bg = 'NONE', fg = 'Red' },
        },
      }
      gruvbox.load()
    end,
  },
}
