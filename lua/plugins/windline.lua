return {
  {
    'windwp/windline.nvim',
    lazy = false,
    config = function()
      local windline = require 'windline'
      local helper = require 'windline.helpers'
      local sep = helper.separators
      local b_components = require 'windline.components.basic'
      local state = _G.WindLine.state
      local HSL = require 'wlanimation.utils'

      local lsp_comps = require 'windline.components.lsp'
      local git_comps = require 'windline.components.git'

      local hl_list = {
        Black = { 'white', 'black' },
        White = { 'black', 'white' },
        Normal = { 'NormalFg', 'NormalBg' },
        Inactive = { 'InactiveFg', 'InactiveBg' },
        Active = { 'ActiveFg', 'ActiveBg' },
      }

      local basic = {}

      local airline_colors = {}

      airline_colors.a = {
        NormalSep = { 'red_a', 'red_b' },
        InsertSep = { 'green_a', 'green_b' },
        VisualSep = { 'yellow_a', 'yellow_b' },
        ReplaceSep = { 'blue_a', 'blue_b' },
        CommandSep = { 'magenta_a', 'magenta_b' },
        Normal = { 'black', 'red_a' },
        Insert = { 'black', 'green_a' },
        Visual = { 'black', 'yellow_a' },
        Replace = { 'black', 'blue_a' },
        Command = { 'black', 'magenta_a' },
      }

      airline_colors.b = {
        NormalSep = { 'red_b', 'red_c' },
        InsertSep = { 'green_b', 'green_c' },
        VisualSep = { 'yellow_b', 'yellow_c' },
        ReplaceSep = { 'blue_b', 'blue_c' },
        CommandSep = { 'magenta_b', 'magenta_c' },
        Normal = { 'white', 'red_b' },
        Insert = { 'white', 'green_b' },
        Visual = { 'white', 'yellow_b' },
        Replace = { 'white', 'blue_b' },
        Command = { 'white', 'magenta_b' },
      }

      airline_colors.c = {
        NormalSep = { 'red_c', 'NormalBg' },
        InsertSep = { 'green_c', 'NormalBg' },
        VisualSep = { 'yellow_c', 'NormalBg' },
        ReplaceSep = { 'blue_c', 'NormalBg' },
        CommandSep = { 'magenta_c', 'NormalBg' },
        Normal = { 'white', 'red_c' },
        Insert = { 'white', 'green_c' },
        Visual = { 'white', 'yellow_c' },
        Replace = { 'white', 'blue_c' },
        Command = { 'white', 'magenta_c' },
      }

      basic.divider = { b_components.divider, hl_list.Normal }

      local width_breakpoint = 100

      basic.section_a = {
        hl_colors = airline_colors.a,
        text = function(_, _, width)
          if width > width_breakpoint then
            return {
              { ' ' .. state.mode[1] .. ' ', state.mode[2] },
              { sep.right_filled, state.mode[2] .. 'Sep' },
            }
          end
          return {
            { ' ' .. state.mode[1]:sub(1, 1) .. ' ', state.mode[2] },
            { sep.right_filled, state.mode[2] .. 'Sep' },
          }
        end,
      }

      basic.section_b = {
        hl_colors = airline_colors.b,
        text = function(bufnr, _, width)
          if width > width_breakpoint and git_comps.is_git(bufnr) then
            return {
              { git_comps.git_branch(), state.mode[2] },
              { ' ', '' },
              { sep.right_filled, state.mode[2] .. 'Sep' },
            }
          end
          return { { sep.right_filled, state.mode[2] .. 'Sep' } }
        end,
      }

      basic.section_c = {
        hl_colors = airline_colors.c,
        text = function()
          return {
            { ' ', state.mode[2] },
            { b_components.cache_file_name('[No Name]', 'unique') },
            { ' ' },
            { sep.right_filled, state.mode[2] .. 'Sep' },
          }
        end,
      }

      basic.section_x = {
        hl_colors = airline_colors.c,
        text = function(_, _, width)
          if width > width_breakpoint then
            return {
              { sep.left_filled, state.mode[2] .. 'Sep' },
              { ' ', state.mode[2] },
              { b_components.file_encoding() },
              { ' ' },
              { b_components.file_format { icon = true } },
              { ' ' },
            }
          end
          return {
            { sep.left_filled, state.mode[2] .. 'Sep' },
          }
        end,
      }

      basic.section_y = {
        hl_colors = airline_colors.b,
        text = function(_, _, width)
          if width > width_breakpoint then
            return {
              { sep.left_filled, state.mode[2] .. 'Sep' },
              { b_components.cache_file_type { icon = true }, state.mode[2] },
              { ' ' },
            }
          end
          return { { sep.left_filled, state.mode[2] .. 'Sep' } }
        end,
      }

      basic.section_z = {
        hl_colors = airline_colors.a,
        text = function(_, _, width)
          if width > width_breakpoint then
            return {
              { sep.left_filled, state.mode[2] .. 'Sep' },
              { '', state.mode[2] },
              { b_components.progress },
              { ' ' },
              { b_components.line_col },
            }
          end
          return {
            { sep.left_filled, state.mode[2] .. 'Sep' },
            { ' ', state.mode[2] },
            { b_components.line_col, state.mode[2] },
          }
        end,
      }

      basic.lsp_diagnos = {
        name = 'diagnostic',
        hl_colors = {
          red = { 'red', 'NormalBg' },
          yellow = { 'yellow', 'NormalBg' },
          blue = { 'blue', 'NormalBg' },
        },
        text = function()
          return {
            { lsp_comps.lsp_error { format = ' ◉ %s', show_zero = true }, 'red' },
            { lsp_comps.lsp_warning { format = ' ◉ %s', show_zero = true }, 'yellow' },
            { lsp_comps.lsp_hint { format = ' ◉ %s', show_zero = true }, 'blue' },
          }
        end,
      }

      basic.git = {
        name = 'git',
        width = width_breakpoint,
        hl_colors = {
          green = { 'green', 'NormalBg' },
          red = { 'red', 'NormalBg' },
          blue = { 'blue', 'NormalBg' },
        },
        text = function(bufnr)
          if git_comps.is_git(bufnr) then
            return {
              { git_comps.diff_added { format = '  %s' }, 'green' },
              { git_comps.diff_removed { format = '  %s' }, 'red' },
              { git_comps.diff_changed { format = ' ◉ %s' }, 'blue' },
            }
          end
          return ''
        end,
      }

      local default = {
        filetypes = { 'default' },
        active = {
          basic.section_a,
          basic.section_b,
          basic.section_c,
          basic.lsp_diagnos,
          basic.divider,
          basic.git,
          basic.section_x,
          basic.section_y,
          basic.section_z,
        },
        inactive = {
          { b_components.full_file_name, hl_list.Inactive },
          { b_components.divider, hl_list.Inactive },
          { b_components.line_col, hl_list.Inactive },
          { b_components.progress, hl_list.Inactive },
        },
      }

      windline.setup {
        colors_name = function(colors)
          local mod = function(c, value)
            if vim.o.background == 'light' then
              return HSL.rgb_to_hsl(c):tint(value):to_rgb()
            end
            return HSL.rgb_to_hsl(c):shade(value):to_rgb()
          end

          colors.magenta_a = mod(colors.white, 0.2)
          colors.magenta_b = mod(colors.cyan, 0.7)
          colors.magenta_c = mod(colors.black, 0.2)

          colors.yellow_a = mod(colors.white, 0.1)
          colors.yellow_b = mod(colors.yellow, 0.5)
          colors.yellow_c = mod(colors.yellow, 0.7)

          colors.blue_a = mod(colors.white, 0.1)
          colors.blue_b = mod(colors.blue, 0.5)
          colors.blue_c = mod(colors.blue, 0.7)

          colors.green_a = mod(colors.white, 0.1)
          colors.green_b = mod(colors.yellow, 0.85)
          colors.green_c = mod(colors.cyan, 0.7)

          colors.red_a = mod(colors.white, 0.1)
          colors.red_b = mod(colors.red, 0.85)
          colors.red_c = mod(colors.red, 0.7)

          return colors
        end,
        statuslines = {
          default,
        },
      }
    end,
  },
}
