return {
  {
    'sindrets/diffview.nvim',
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
