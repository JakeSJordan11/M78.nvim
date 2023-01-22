return {
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
      local wk = require 'which-key'
      wk.register {
        ['<Leader>g'] = {
          name = 'Git',
          k = { '<Cmd>Gitsigns prev_hunk<CR>', 'Prev Hunk' },
          L = { '<Cmd>Gitsigns blame_line<CR>', 'Blame' },
          n = { '<Cmd>Gitsigns toggle_numhl<CR>', 'Toggle Number Highlight' },
          P = { '<Cmd>Gitsigns preview_hunk<CR>', 'Preview Hunk' },
          R = { '<Cmd>Gitsigns reset_hunk<CR>', 'Reset Hunk' },
          r = { '<Cmd>Gitsigns reset_buffer<CR>', 'Reset Buffer' },
          S = { '<Cmd>Gitsigns stage_hunk<CR>', 'Stage Hunk' },
          s = { '<Cmd>Gitsigns toggle_signs<CR>', 'Toggle Signs' },
          U = { '<Cmd>Gitsigns undo_stage_hunk<CR>', 'Undo Stage Hunk' },
        },
      }
    end,
  },
}
