return {
  {
    'windwp/windline.nvim',
    event = 'BufRead',
    config = function()
      vim.opt.laststatus = 3
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

          colors.Normal = require('windline.themes').get_hl_color 'Normal'
          colors.Normal2 = mod(colors.Normal, 0.2)

          colors.Red = require('windline.themes').get_hl_color 'Statement'
          colors.Orange = require('windline.themes').get_hl_color 'Special'
          colors.Yellow = require('windline.themes').get_hl_color 'Type'
          colors.Green = require('windline.themes').get_hl_color 'Function'
          colors.Blue = require('windline.themes').get_hl_color 'Identifier'
          colors.Purple = require('windline.themes').get_hl_color 'Constant'
          colors.Aqua = require('windline.themes').get_hl_color 'Include'
          colors.Gray = require('windline.themes').get_hl_color 'Comment'

          colors.DiagnosticError = require('windline.themes').get_hl_color 'DiagnosticError'
          colors.DiagnosticWarn = require('windline.themes').get_hl_color 'DiagnosticWarn'
          colors.DiagnosticInfo = require('windline.themes').get_hl_color 'DiagnosticInfo'
          colors.DiagnosticHint = require('windline.themes').get_hl_color 'DiagnosticHint'

          colors.DiffAdded = require('windline.themes').get_hl_color 'diffAdded'
          colors.DiffChanged = require('windline.themes').get_hl_color 'diffChanged'
          colors.DiffRemoved = require('windline.themes').get_hl_color 'diffRemoved'

          return colors
        end,

        statuslines = { statuslines.default, statuslines.trouble },
      }
    end,
  },
}
