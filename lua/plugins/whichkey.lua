return {
  {
    'folke/which-key.nvim',
    config = function()
      local wk = require 'which-key'
      local Terminal = require('toggleterm.terminal').Terminal
      local lazygit = Terminal:new { cmd = 'lazygit', hidden = true }

      local setup = {
        window = {
          border = 'rounded',
          position = 'top',
          margin = { 2, 8, 2, 8 },
        },
        layout = {
          align = 'center',
        },
        ignore_missing = true,
      }

      local opts = {
        mode = 'n',
        prefix = '<Leader>',
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = true,
      }

      local mappings = {
        ['c'] = { '<Cmd>bdelete!<CR>', 'Close Buffer' },

        g = {
          name = 'Git',
          g = {
            function()
              lazygit:toggle()
            end,
            'Lazygit',
          },
          P = { '<Cmd>!git push<CR>', 'Push' },
          p = { '<Cmd>!git pull<CR>', 'Pull' },
        },

        w = {
          name = 'Window',
          cmd = '<C-w>',
          s = 'Split window',
          v = 'Split window vertically',
          w = 'Switch windows',
          q = 'Quit a window',
          T = 'Break out into a new tab',
          x = 'Swap current with next',
          ['-'] = 'Decrease height',
          ['+'] = 'Increase height',
          ['<lt>'] = 'Decrease width',
          ['>'] = 'Increase width',
          ['|'] = 'Max out the width',
          ['_'] = 'Max out the height',
          ['='] = 'Equally high and wide',
          h = 'Go to the left window',
          l = 'Go to the right window',
          k = 'Go to the up window',
          j = 'Go to the down window',
        },
      }
      wk.setup(setup)
      wk.register(mappings, opts)
    end,
  },
}
