return {
  'ellisonleao/gruvbox.nvim',
  event = 'VeryLazy',
  lazy = false,
  priority = 1000,
  config = function()
    local gruvbox = require 'gruvbox'
    gruvbox.setup {
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
        NotifyERRORBorder = { link = 'DiagnosticError' },
        NotifyERRORIcon = { link = 'DiagnosticError' },
        NotifyERRORTitle = { link = 'DiagnosticError' },
        NotifyWARNBorder = { link = 'DiagnosticWarn' },
        NotifyWARNIcon = { link = 'DiagnosticWarn' },
        NotifyWARNTitle = { link = 'DiagnosticWarn' },
        NotifyINFOBorder = { link = 'DiagnosticInfo' },
        NotifyINFOIcon = { link = 'DiagnosticInfo' },
        NotifyINFOTitle = { link = 'DiagnosticInfo' },
      },
    }
    gruvbox.load()
  end,
}
