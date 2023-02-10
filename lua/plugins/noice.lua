return {
  {
    'folke/noice.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      {
        'rcarriga/nvim-notify',
        config = function()
          vim.api.nvim_set_hl(0, 'NotifyERRORBorder', { link = 'DiagnosticError' })
          vim.api.nvim_set_hl(0, 'NotifyERRORIcon', { link = 'DiagnosticError' })
          vim.api.nvim_set_hl(0, 'NotifyERRORTitle', { link = 'DiagnosticError' })
          vim.api.nvim_set_hl(0, 'NotifyWARNBorder', { link = 'DiagnosticWarn' })
          vim.api.nvim_set_hl(0, 'NotifyWARNIcon', { link = 'DiagnosticWarn' })
          vim.api.nvim_set_hl(0, 'NotifyWARNTitle', { link = 'DiagnosticWarn' })
          vim.api.nvim_set_hl(0, 'NotifyINFOBorder', { link = 'DiagnosticInfo' })
          vim.api.nvim_set_hl(0, 'NotifyINFOIcon', { link = 'DiagnosticInfo' })
          vim.api.nvim_set_hl(0, 'NotifyINFOTitle', { link = 'DiagnosticInfo' })
          local notify = require 'notify'
          notify.setup {
            fps = 120,
            top_down = false,
            timeout = 1500,
            max_height = function()
              return math.floor(vim.o.lines * 0.50)
            end,
            max_width = function()
              return math.floor(vim.o.columns * 0.45)
            end,
            on_open = function(win)
              vim.api.nvim_win_set_config(win, { focusable = false })
            end,
          }
        end,
      },
    },
    config = function()
      require('noice').setup {
        presets = {
          command_palette = true,
          lsp_doc_border = true,
        },
        lsp = {
          progress = {
            view = 'notify',
          },
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true,
          },
        },
        views = {
          notify = {
            replace = true,
          },
        },
      }
    end,
  },
}
