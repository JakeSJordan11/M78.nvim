return {
  {
    'windwp/windline.nvim',
    config = function()
      local windline = require 'windline'
      local HSL = require 'wlanimation.utils'
      local statuslines = require 'plugins.windline.statuslines'

      windline.setup {
        colors_name = function(colors)
          local mod = function(c, value)
            if vim.o.background == 'light' then
              return HSL.rgb_to_hsl(c):tint(value):to_rgb()
            end
            return HSL.rgb_to_hsl(c):shade(value):to_rgb()
          end

          local NormalFg, NormalBg = require('windline.themes').get_hl_color 'Normal'
          colors.Normal = { NormalFg, NormalBg }

          -- GruvboxPurple
          colors.Constant = require('windline.themes').get_hl_color 'Constant'
          -- GruvboxYellow
          colors.Type = require('windline.themes').get_hl_color 'Type'
          -- GruvboxGreenBold
          colors.Function = require('windline.themes').get_hl_color 'Function'
          -- GruvboxOrange
          colors.Special = require('windline.themes').get_hl_color 'Special'
          -- GruvboxBlue
          colors.Identifier = require('windline.themes').get_hl_color 'Identifier'
          -- GruvboxRed
          colors.Statement = require('windline.themes').get_hl_color 'Statement'
          -- GruvboxAqua
          colors.Include = require('windline.themes').get_hl_color 'Include'

          colors.Comment = require('windline.themes').get_hl_color 'Comment'

          -- colors.DiagnosticError = require('windline.themes').get_hl_color 'DiagnosticError'
          -- colors.DiagnosticWarn = require('windline.themes').get_hl_color 'DiagnosticWarn'
          -- colors.DiagnosticInfo = require('windline.themes').get_hl_color 'DiagnosticInfo'
          -- colors.DiagnosticHint = require('windline.themes').get_hl_color 'DiagnosticHint'
          --
          -- colors.diffAdded = require('windline.themes').get_hl_color 'diffAdded'
          -- colors.diffChanged = require('windline.themes').get_hl_color 'diffChanged'
          -- colors.diffRemoved = require('windline.themes').get_hl_color 'diffRemoved'

          return colors
        end,

        statuslines = { statuslines.default, statuslines.winbar, statuslines.quickfix },
      }
    end,
  },
}
