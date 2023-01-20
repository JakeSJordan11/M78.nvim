return {
  {
    'windwp/windline.nvim',
    config = function()
      local windline = require 'windline'
      local lsp_comps = require 'windline.components.lsp'
      local basic = require 'windline.components.basic'

      local winbar = {
        filetypes = { 'winbar' },
        active = {
          { ' ' },
          { '%=' },
          {
            '@@',
            { 'red', 'white' },
          },
        },
        inactive = {
          { ' ', { 'white', 'InactiveBg' } },
          { '%=' },
          {
            function(bufnr)
              local bufname = vim.api.nvim_buf_get_name(bufnr)
              local path = vim.fn.fnamemodify(bufname, ':~:.')
              return path
            end,
            { 'white', 'InactiveBg' },
          },
        },
        --- enable=function(bufnr,winid)  return true end --a function to disable winbar on some window or filetype
      }

      -- windline.add_status(winbar)
      -- or you can use a setup function to add winbar

      basic.lsp_diagnos = {
        name = 'diagnostic',
        hl_colors = {
          red_text = { 'red', 'black' },
        },
        text = function(bufnr, winid, width)
          if lsp_comps.check_lsp() then
            return {

              { '[ lsp: ', 'red_text' },
              -- red_text define in hl_colors. It make easy cache value first
              -- because text function run multiple time on redraw

              { lsp_comps.lsp_name(), 'IncSearch' },
              -- it use a hightlight group IncSearch

              -- but you can create a hightlight on child component too
              { lsp_comps.lsp_error { format = '  %s' }, { 'red', 'black' } },

              { lsp_comps.lsp_warning { format = '  %s' }, { 'yellow', '' } },
              -- it have same background black with the previous component

              { lsp_comps.lsp_hint { format = '  %s' }, { '', 'blue' } },
              -- it have same foreground yellow with the previous component

              { ' ] ' },
            }
          end
          return ''
        end,
      }
      local telescope = {
        filetypes = { 'TelescopePrompt' },
        active = {
          { '  ', 'IncSearch' },
        },
        global_show_float = true,
      }

      local finecmdline = {
        filetypes = { 'FineLinePrompt' },
        active = {
          { ' : ', 'Constant' },
        },
        global_show_float = true,
      }

      local default = {
        filetypes = { 'default' },
        active = {
          --- components...
          { '[', { 'red', 'black' } },
          { '%f', { 'green', 'black' } },
          { ']', { 'red', 'black' } },

          -- empty color definition uses the previous component colors
          { '%=', '' },

          -- hightlight groups can also be used
          { ' ', 'StatusLine' },

          { ' %3l:%-2c ', { 'white', 'black' } },
        },
        inactive = {
          { 'innactive', { 'white', 'black' } },
          { ' ' },
          { 'component 2', { 'white', 'black' } },
        },
      }
      windline.setup {
        statuslines = { default, winbar, telescope, finecmdline },
      }
    end,
  },
}
