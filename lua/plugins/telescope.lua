return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'ibhagwan/fzf-lua',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-telescope/telescope-dap.nvim',
    'LinArcX/telescope-ports.nvim',
    'nvim-telescope/telescope-project.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
    { 'AckslD/nvim-neoclip.lua', config = true },
    'olacin/telescope-gitmoji.nvim',
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
        colorscheme = {
          theme = 'dropdown',
        },
      },
      extensions = {
        file_browser = {
          previewer = false,
          theme = 'dropdown',
        },
        project = {
          base_dirs = {
            '~/Development/',
          },
          -- hidden_files = true, -- default: false
          theme = 'dropdown',
          -- order_by = 'asc',
          -- search_by = 'title',
        },
      },
    }
    require('telescope').load_extension 'fzf'
    require('telescope').load_extension 'ui-select'
    require('telescope').load_extension 'file_browser'
    require('telescope').load_extension 'ports'
    require('telescope').load_extension 'project'
    require('telescope').load_extension 'projects'
    require('telescope').load_extension 'noice'
    require('telescope').load_extension 'neoclip'
    require('telescope').load_extension 'gitmoji'

    local wk = require 'which-key'
    wk.register {

      ['<Leader>f'] = {
        name = 'Find',
        B = { '<Cmd>Telescope buffers<CR>', 'Buffers' },
        b = { '<Cmd>Telescope file_browser<CR>', 'Files with file browser' },
        c = { '<Cmd>Telescope colorscheme<CR>', 'Colorschemes' },
        d = { '<Cmd>Telescope diagnostics<CR>', 'Document diagnostics' },
        f = { '<Cmd>Telescope find_files<CR>', 'Files' },
        h = { '<Cmd>Telescope help_tags<CR>', 'Help' },
        k = { '<Cmd>Telescope keymaps<CR>', 'Keymaps' },
        p = { '<Cmd>Telescope projects<CR>', 'Projects' },
        r = { '<Cmd>Telescope oldfiles<CR>', 'Recent Files' },
        t = { '<Cmd>Telescope live_grep<CR>', 'Find Text' },
      },

      ['<Leader>g'] = {
        name = 'Git',
        b = { '<Cmd>Telescope git_branches<CR>', 'Checkout Branch' },
        c = { '<Cmd>Telescope git_commits<CR>', 'Checkout Commit' },
        s = { '<Cmd>Telescope git_status<CR>', 'Git Status' },
        m = { '<Cmd>Telescope gitmoji<CR>', 'Gitmoji' },
      },
    }
  end,
}
