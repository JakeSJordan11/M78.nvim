return {
  {
    'windwp/windline.nvim',
    lazy = false,
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

          colors.black1 = mod(colors.black, 0.1)
          colors.black2 = mod(colors.black, 0.2)
          colors.black3 = mod(colors.black, 0.3)
          colors.black4 = mod(colors.black, 0.4)
          colors.black5 = mod(colors.black, 0.5)
          colors.black6 = mod(colors.black, 0.6)
          colors.black7 = mod(colors.black, 0.7)
          colors.black8 = mod(colors.black, 0.8)
          colors.black9 = mod(colors.black, 0.9)

          colors.red1 = mod(colors.red, 0.1)
          colors.red2 = mod(colors.red, 0.2)
          colors.red3 = mod(colors.red, 0.3)
          colors.red4 = mod(colors.red, 0.4)
          colors.red5 = mod(colors.red, 0.5)
          colors.red6 = mod(colors.red, 0.6)
          colors.red7 = mod(colors.red, 0.7)
          colors.red8 = mod(colors.red, 0.8)
          colors.red9 = mod(colors.red, 0.9)

          colors.green1 = mod(colors.green, 0.1)
          colors.green2 = mod(colors.green, 0.2)
          colors.green3 = mod(colors.green, 0.3)
          colors.green4 = mod(colors.green, 0.4)
          colors.green5 = mod(colors.green, 0.5)
          colors.green6 = mod(colors.green, 0.6)
          colors.green7 = mod(colors.green, 0.7)
          colors.green8 = mod(colors.green, 0.8)
          colors.green9 = mod(colors.green, 0.9)

          colors.yellow1 = mod(colors.yellow, 0.1)
          colors.yellow2 = mod(colors.yellow, 0.2)
          colors.yellow3 = mod(colors.yellow, 0.3)
          colors.yellow4 = mod(colors.yellow, 0.4)
          colors.yellow5 = mod(colors.yellow, 0.5)
          colors.yellow6 = mod(colors.yellow, 0.6)
          colors.yellow7 = mod(colors.yellow, 0.7)
          colors.yellow8 = mod(colors.yellow, 0.8)
          colors.yellow9 = mod(colors.yellow, 0.9)

          colors.blue1 = mod(colors.blue, 0.1)
          colors.blue2 = mod(colors.blue, 0.2)
          colors.blue3 = mod(colors.blue, 0.3)
          colors.blue4 = mod(colors.blue, 0.4)
          colors.blue5 = mod(colors.blue, 0.5)
          colors.blue6 = mod(colors.blue, 0.6)
          colors.blue7 = mod(colors.blue, 0.7)
          colors.blue8 = mod(colors.blue, 0.8)
          colors.blue9 = mod(colors.blue, 0.9)

          colors.magenta1 = mod(colors.magenta, 0.1)
          colors.magenta2 = mod(colors.magenta, 0.2)
          colors.magenta3 = mod(colors.magenta, 0.3)
          colors.magenta4 = mod(colors.magenta, 0.4)
          colors.magenta5 = mod(colors.magenta, 0.5)
          colors.magenta6 = mod(colors.magenta, 0.6)
          colors.magenta7 = mod(colors.magenta, 0.7)
          colors.magenta8 = mod(colors.magenta, 0.8)
          colors.magenta9 = mod(colors.magenta, 0.9)

          colors.cyan1 = mod(colors.cyan, 0.1)
          colors.cyan2 = mod(colors.cyan, 0.2)
          colors.cyan3 = mod(colors.cyan, 0.3)
          colors.cyan4 = mod(colors.cyan, 0.4)
          colors.cyan5 = mod(colors.cyan, 0.5)
          colors.cyan6 = mod(colors.cyan, 0.6)
          colors.cyan7 = mod(colors.cyan, 0.7)
          colors.cyan8 = mod(colors.cyan, 0.8)
          colors.cyan9 = mod(colors.cyan, 0.9)

          colors.white1 = mod(colors.white, 0.1)
          colors.white2 = mod(colors.white, 0.2)
          colors.white3 = mod(colors.white, 0.3)
          colors.white4 = mod(colors.white, 0.4)
          colors.white5 = mod(colors.white, 0.5)
          colors.white6 = mod(colors.white, 0.6)
          colors.white7 = mod(colors.white, 0.7)
          colors.white8 = mod(colors.white, 0.8)
          colors.white9 = mod(colors.white, 0.9)

          colors.black_light1 = mod(colors.black_light, 0.1)
          colors.black_light2 = mod(colors.black_light, 0.2)
          colors.black_light3 = mod(colors.black_light, 0.3)
          colors.black_light4 = mod(colors.black_light, 0.4)
          colors.black_light5 = mod(colors.black_light, 0.5)
          colors.black_light6 = mod(colors.black_light, 0.6)
          colors.black_light7 = mod(colors.black_light, 0.7)
          colors.black_light8 = mod(colors.black_light, 0.8)
          colors.black_light9 = mod(colors.black_light, 0.9)

          colors.red_light1 = mod(colors.red_light, 0.1)
          colors.red_light2 = mod(colors.red_light, 0.2)
          colors.red_light3 = mod(colors.red_light, 0.3)
          colors.red_light4 = mod(colors.red_light, 0.4)
          colors.red_light5 = mod(colors.red_light, 0.5)
          colors.red_light6 = mod(colors.red_light, 0.6)
          colors.red_light7 = mod(colors.red_light, 0.7)
          colors.red_light8 = mod(colors.red_light, 0.8)
          colors.red_light9 = mod(colors.red_light, 0.9)

          colors.green_light1 = mod(colors.green_light, 0.1)
          colors.green_light2 = mod(colors.green_light, 0.2)
          colors.green_light3 = mod(colors.green_light, 0.3)
          colors.green_light4 = mod(colors.green_light, 0.4)
          colors.green_light5 = mod(colors.green_light, 0.5)
          colors.green_light6 = mod(colors.green_light, 0.6)
          colors.green_light7 = mod(colors.green_light, 0.7)
          colors.green_light8 = mod(colors.green_light, 0.8)
          colors.green_light9 = mod(colors.green_light, 0.9)

          colors.yellow_light1 = mod(colors.yellow_light, 0.1)
          colors.yellow_light2 = mod(colors.yellow_light, 0.2)
          colors.yellow_light3 = mod(colors.yellow_light, 0.3)
          colors.yellow_light4 = mod(colors.yellow_light, 0.4)
          colors.yellow_light5 = mod(colors.yellow_light, 0.5)
          colors.yellow_light6 = mod(colors.yellow_light, 0.6)
          colors.yellow_light7 = mod(colors.yellow_light, 0.7)
          colors.yellow_light8 = mod(colors.yellow_light, 0.8)
          colors.yellow_light9 = mod(colors.yellow_light, 0.9)

          colors.blue_light1 = mod(colors.blue_light, 0.1)
          colors.blue_light2 = mod(colors.blue_light, 0.2)
          colors.blue_light3 = mod(colors.blue_light, 0.3)
          colors.blue_light4 = mod(colors.blue_light, 0.4)
          colors.blue_light5 = mod(colors.blue_light, 0.5)
          colors.blue_light6 = mod(colors.blue_light, 0.6)
          colors.blue_light7 = mod(colors.blue_light, 0.7)
          colors.blue_light8 = mod(colors.blue_light, 0.8)
          colors.blue_light9 = mod(colors.blue_light, 0.9)

          colors.magenta_light1 = mod(colors.magenta_light, 0.1)
          colors.magenta_light2 = mod(colors.magenta_light, 0.2)
          colors.magenta_light3 = mod(colors.magenta_light, 0.3)
          colors.magenta_light4 = mod(colors.magenta_light, 0.4)
          colors.magenta_light5 = mod(colors.magenta_light, 0.5)
          colors.magenta_light6 = mod(colors.magenta_light, 0.6)
          colors.magenta_light7 = mod(colors.magenta_light, 0.7)
          colors.magenta_light8 = mod(colors.magenta_light, 0.8)
          colors.magenta_light9 = mod(colors.magenta_light, 0.9)

          colors.cyan_light1 = mod(colors.cyan_light, 0.1)
          colors.cyan_light2 = mod(colors.cyan_light, 0.2)
          colors.cyan_light3 = mod(colors.cyan_light, 0.3)
          colors.cyan_light4 = mod(colors.cyan_light, 0.4)
          colors.cyan_light5 = mod(colors.cyan_light, 0.5)
          colors.cyan_light6 = mod(colors.cyan_light, 0.6)
          colors.cyan_light7 = mod(colors.cyan_light, 0.7)
          colors.cyan_light8 = mod(colors.cyan_light, 0.8)
          colors.cyan_light9 = mod(colors.cyan_light, 0.9)

          colors.white_light1 = mod(colors.white_light, 0.1)
          colors.white_light2 = mod(colors.white_light, 0.2)
          colors.white_light3 = mod(colors.white_light, 0.3)
          colors.white_light4 = mod(colors.white_light, 0.4)
          colors.white_light5 = mod(colors.white_light, 0.5)
          colors.white_light6 = mod(colors.white_light, 0.6)
          colors.white_light7 = mod(colors.white_light, 0.7)
          colors.white_light8 = mod(colors.white_light, 0.8)
          colors.white_light9 = mod(colors.white_light, 0.9)

          colors.DiagnostivcSignError = require('windline.themes').get_hl_color 'DiagnosticSignError'
          colors.DiagnostivcSignWarn = require('windline.themes').get_hl_color 'DiagnosticSignWarn'
          colors.DiagnostivcSignInfo = require('windline.themes').get_hl_color 'DiagnosticSignInfo'
          colors.DiagnostivcSignHint = require('windline.themes').get_hl_color 'DiagnosticSignHint'

          colors.GitSignsAdd = require('windline.themes').get_hl_color 'GitSignsAdd'
          colors.GitSignsChange = require('windline.themes').get_hl_color 'GitSignsChange'
          colors.GitSignsDelete = require('windline.themes').get_hl_color 'GitSignsDelete'

          return colors
        end,

        statuslines = { statuslines.default, statuslines.winbar, statuslines.quickfix },
      }
    end,
  },
}
