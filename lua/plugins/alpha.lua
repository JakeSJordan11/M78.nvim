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

    local buttons = {
      Projects = {
        button = dashboard.button('p', 'Projects', '<Cmd>Telescope projects<CR>'),
        icon = ' ',
      },
      RecentFiles = {
        button = dashboard.button('r', 'Recent Files', '<Cmd>Telescope oldfiles<CR>'),
        icon = ' ',
      },
      Configuration = {
        button = dashboard.button('c', 'Neovim Configuration', '<Cmd>e ~/.config/nvim/init.lua<CR>'),
        icon = ' ',
      },
      Lazy = {
        button = dashboard.button('z', 'Lazy', '<Cmd>Lazy<CR>'),
        icon = '鈴',
      },
      Mason = {
        button = dashboard.button('m', 'Mason', '<Cmd>Mason<CR>'),
        icon = ' ',
      },
      Reopen = {
        button = dashboard.button('o', 'Reopen Last File', '<C-o><C-o>'),
        icon = '淚',
      },
      Quit = {
        button = dashboard.button('q', 'Quit Neovim', '<Cmd>qa<CR>'),
        icon = ' ',
      },
    }

    dashboard.section.header.val = header
    dashboard.section.buttons.val = {
      buttons.Projects.button,
      buttons.RecentFiles.button,
      buttons.Configuration.button,
      buttons.Lazy.button,
      buttons.Mason.button,
      buttons.Reopen.button,
      buttons.Quit.button,
    }

    local icons = {
      buttons.Projects.icon,
      buttons.RecentFiles.icon,
      buttons.Configuration.icon,
      buttons.Lazy.icon,
      buttons.Mason.icon,
      buttons.Reopen.icon,
      buttons.Quit.icon,
    }

    for index, value in ipairs(dashboard.section.buttons.val) do
      local width = 25
      value.opts.hl = 'Keyword'
      value.opts.width = width
      value.opts.cursor = width
      value.opts.hl_shortcut = 'Special'
      value.opts.shortcut = icons[index]
    end

    dashboard.opts.opts.noautocmd = true
    require('alpha').setup(dashboard.opts)

    require('alpha').setup(dashboard.config)
  end,
}
