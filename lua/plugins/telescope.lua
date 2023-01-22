return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    'ahmedkhalf/project.nvim',
    'nvim-telescope/telescope-dap.nvim',
    'LinArcX/telescope-ports.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
  },
  config = function()
    require('telescope').setup {
      defaults = {
        layout_config = {
          prompt_position = 'top',
        },
        sorting_strategy = 'ascending',
      },
      pickers = {
        ['colorscheme'] = {
          theme = 'dropdown',
        },
      },
      extensions = {
        ['file_browser'] = {
          previewer = false,
          theme = 'dropdown',
        },
      },
    }
    require('telescope').load_extension 'fzf'
    require('telescope').load_extension 'projects'
    require('telescope').load_extension 'ui-select'
    require('telescope').load_extension 'file_browser'
    require('telescope').load_extension 'ports'

    local wk = require 'which-key'
    wk.register {
      ['<Leader>b'] = { '<Cmd>Telescope buffers<CR>', 'Buffers' },

      ['<Leader>f'] = {
        name = 'Find',
        b = { '<Cmd>Telescope file_browser<CR>', 'Files with file browser' },
        C = { '<Cmd>Telescope commands<CR>', 'Commands' },
        c = { '<Cmd>Telescope colorscheme<CR>', 'Colorschemes' },
        d = { '<Cmd>Telescope diagnostics<CR>', 'Document diagnostics' },
        f = { '<Cmd>Telescope find_files<CR>', 'Files' },
        h = { '<Cmd>Telescope help_tags<CR>', 'Help' },
        k = { '<Cmd>Telescope keymaps<CR>', 'Keymaps' },
        p = { '<Cmd>Telescope projects<CR>', 'Projects' },
        R = { '<Cmd>Telescope registers<CR>', 'Registers' },
        r = { '<Cmd>Telescope oldfiles<CR>', 'Recent Files' },
        t = { '<Cmd>Telescope live_grep<CR>', 'Find Text' },
      },

      ['<Leader>g'] = {
        name = 'Git',
        b = { '<Cmd>Telescope git_branches<CR>', 'Checkout Branch' },
        c = { '<Cmd>Telescope git_commits<CR>', 'Checkout Commit' },
        o = { '<Cmd>Telescope git_status<CR>', 'Git Status' },
      },
    }
  end,
}
