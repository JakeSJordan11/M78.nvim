return {
  {
    'akinsho/toggleterm.nvim',
    event = 'VeryLazy',
    config = function()
      local toggleTerm = require 'toggleterm'
      local Terminal = require('toggleterm.terminal').Terminal
      local lazygit = Terminal:new { cmd = 'lazygit', hidden = true, direction = 'float', float_opts = { border = 'rounded' } }

      local wk = require 'which-key'

      wk.register {
        ['<Leader>gg'] = {
          function()
            lazygit:toggle()
          end,
          'Lazygit',
        },
      }
      toggleTerm.setup {
        size = 25,
        open_mapping = [[<c-\>]],
        shade_terminals = false,
        direction = 'horizontal',
      }
    end,
  },
}
