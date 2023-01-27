return {
  {
    'sindrets/diffview.nvim',
    event = 'BufRead',
    config = function()
      require('diffview').setup()
      local wk = require 'which-key'
      wk.register {
        ['<Leader>g'] = {
          name = 'Git',
          d = { '<Cmd>DiffviewOpen<CR>', 'Diff' },
        },
      }
    end,
  },
}
