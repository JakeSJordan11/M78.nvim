require('wlsample.airline_anim')
local windline = require('windline')
local effects = require('wlanimation.effects')
local HSL = require('wlanimation.utils')
require('wlsample.airline')
local animation = require('wlanimation')

local magenta_anim = {}
local yellow_anim = {}
local blue_anim = {}
local green_anim = {}
local red_anim = {}
local colors = windline.get_colors()

if vim.o.background == 'light' then
  magenta_anim = HSL.rgb_to_hsl(colors.magenta):tints(10, 8)
  yellow_anim = HSL.rgb_to_hsl(colors.yellow):tints(10, 8)
  blue_anim = HSL.rgb_to_hsl(colors.blue):tints(10, 8)
  green_anim = HSL.rgb_to_hsl(colors.green):tints(10, 8)
  red_anim = HSL.rgb_to_hsl(colors.red):tints(10, 8)
else
  -- shades will create array of color from color to black color .I don't need
  -- black color then I only take 8
  magenta_anim = HSL.rgb_to_hsl(colors.magenta):shades(10, 8)
  yellow_anim = HSL.rgb_to_hsl(colors.yellow):shades(10, 8)
  blue_anim = HSL.rgb_to_hsl(colors.blue):shades(10, 8)
  green_anim = HSL.rgb_to_hsl(colors.green):shades(10, 8)
  red_anim = HSL.rgb_to_hsl(colors.red):shades(10, 8)
end

animation.stop_all()
animation.animation({
  data = {
    { 'magenta_a', effects.list_color(magenta_anim, 3) },
    { 'magenta_b', effects.list_color(magenta_anim, 2) },
    { 'magenta_c', effects.list_color(magenta_anim, 1) },

    { 'yellow_a', effects.list_color(yellow_anim, 3) },
    { 'yellow_b', effects.list_color(yellow_anim, 2) },
    { 'yellow_c', effects.list_color(yellow_anim, 1) },

    { 'blue_a', effects.list_color(blue_anim, 3) },
    { 'blue_b', effects.list_color(blue_anim, 2) },
    { 'blue_c', effects.list_color(blue_anim, 1) },

    { 'green_a', effects.list_color(green_anim, 3) },
    { 'green_b', effects.list_color(green_anim, 2) },
    { 'green_c', effects.list_color(green_anim, 1) },

    { 'red_a', effects.list_color(red_anim, 3) },
    { 'red_b', effects.list_color(red_anim, 2) },
    { 'red_c', effects.list_color(red_anim, 1) },
  },

  timeout = 60,
  delay = 120,
  interval = 120,
})


windline.default = {
  filetypes = { 'default' },
  active = {
    --- components...
  },
  inactive = {
    --- components...
  }
}

windline.explorer = {
  filetypes = { 'fern', 'NvimTree', 'netrw' },
  active = {
    { '  ', { 'white', 'black' } },
  },
  --- show active components when the window is inactive
  always_active = true,
  --- It will display a last window statusline even that window should inactive
  show_last_status = true,

  -- setting for floatline
  -- display statusline to that filetype.If that filetype on floating window
  floatline_show_float = false,
  -- display both on floatline and default statusline
  floatline_show_both = false
}
