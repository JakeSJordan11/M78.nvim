return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  config = function()
    local wk = require 'which-key'
    wk.register {
      ['<Leader>a'] = { '<Cmd>Alpha<CR>', 'Alpha' },
    }
    local dashboard = require 'alpha.themes.dashboard'

    local header = {
      "         You'll Find it Bud, I Promise    ",
      '',
      '    ooooooooooooooooooooooooooooooooooooo',
      "    8                                .d88',",
      "    8   oooooooooooooooooooooooooooo 8888',",
      '    8  8888888888888888888888888P"   8888\',',
      '    8  8888888888888888888888P"      8888\',',
      '    8  8888888888888888888P"         8888\',',
      '    8  8888888888888888P"            8888\',',
      '    8  8888888888888P"               8888\',',
      '    8  8888888888P"                  8888\',',
      '    8  8888888P"                     8888\',',
      '    8  8888P"                        8888\',',
      "    8 d8888888888888888888888888888888888',",
      '    8 88888888888888888888888888888888888/',
      "           8ooooooooooooooocgmm8888\\'",
      '       ooooooooooooooooooooooooooooooo,',
      "      d                       ...oood8b',",
      "     d              ...oood888888888888b',",
      "    d     ...oood88888888888888888888888b',",
      "   dood8888888888888888888888888888888888b'",
    }

    local icons = {
      ' ',
      ' ',
      ' ',
      ' ',
      ' ',
    }

    dashboard.section.header.val = header
    dashboard.section.buttons.val = {
      dashboard.button('p', '[P]rojects', '<Cmd>Telescope projects<CR>'),
      dashboard.button('r', '[R]ecent Files', '<Cmd>Telescope frecency<CR>'),
      dashboard.button('o', '[O]pen Last File', '<C-o><C-o>'),
      dashboard.button('c', '[C]onfiguration', '<Cmd>e ~/Development/M78.nvim/init.lua<CR>'),
      dashboard.button('q', '[Q]uit Neovim', '<Cmd>qa<CR>'),
    }

    for index, value in pairs(dashboard.section.buttons.val) do
      local width = 30
      value.opts.hl = 'Keyword'
      value.opts.width = width
      value.opts.cursor = width
      value.opts.hl_shortcut = 'Special'
      value.opts.shortcut = icons[index]
    end

    if vim.o.filetype == 'lazy' then
      vim.cmd.close()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'AlphaReady',
        callback = function()
          require('lazy').show()
        end,
      })
    end

    require('alpha').setup(dashboard.config)

    vim.api.nvim_create_autocmd('User', {
      callback = function()
        local stats = require('lazy').stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = '⚡ Neovim loaded ' .. stats.count .. ' plugins in ' .. ms .. 'ms'
        pcall(vim.cmd.AlphaRedraw)
      end,
      pattern = 'LazyVimStarted',
    })
  end,
}
