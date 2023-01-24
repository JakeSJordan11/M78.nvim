return {
  'goolord/alpha-nvim',
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
    local button = {
      Projects = dashboard.button('p', 'Search Projects', '<Cmd>Telescope project<CR>'),
      RecentFiles = dashboard.button('r', 'File History', '<Cmd>Telescope oldfiles<CR>'),
      Configuration = dashboard.button('c', 'Configuration', ':cd ~/.config/nvim<CR>' .. '<Cmd>e init.lua<CR>'),
      Quit = dashboard.button('q', 'Quit Neovim', '<Cmd>qa<CR>'),
    }

    dashboard.section.header.val = header
    dashboard.section.buttons.val = {
      button.Projects,
      button.RecentFiles,
      button.Configuration,
      button.Quit,
    }

    local icons = {
      ' ',
      ' ',
      ' ',
      ' ',
    }
    for index, value in ipairs(dashboard.section.buttons.val) do
      local width = 25
      value.opts.hl = 'Keyword'
      value.opts.width = width
      value.opts.cursor = width
      value.opts.shortcut = icons[index]
      value.opts.hl_shortcut = 'Special'
    end

    dashboard.opts.opts.noautocmd = true
    require('alpha').setup(dashboard.opts)

    require('alpha').setup(dashboard.config)
  end,
}
