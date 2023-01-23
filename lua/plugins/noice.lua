return {
  {
    'folke/noice.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      {
        'rcarriga/nvim-notify',
        opts = {
          fps = 120,
          stages = 'slide',
          timeout = 3000,
          top_down = false,
        },
      },
      {
        'smjonas/inc-rename.nvim',
        config = function()
          local wk = require 'which-key'
          wk.register {
            ['<leader>r'] = {
              name = 'Rename',
              n = { ':IncRename ', 'Rename' },
            },
          }
          require('inc_rename').setup()
        end,
      },
    },

    config = function()
      require('noice').setup {
        lsp = {
          override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true,
          },
        },
        presets = {
          bottom_search = false,
          command_palette = true,
          long_message_to_split = true,
          inc_rename = true,
          lsp_doc_border = true,
        },
      }
    end,
  },
}
