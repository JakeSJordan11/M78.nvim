return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'ibhagwan/fzf-lua',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
    'nvim-telescope/telescope-file-browser.nvim',
    'olacin/telescope-gitmoji.nvim',
    { 'AckslD/nvim-neoclip.lua', config = true },
    'MaximilianLloyd/adjacent.nvim',
    {
      'ahmedkhalf/project.nvim',
      config = function()
        require('project_nvim').setup()
      end,
    },
    { 'nvim-telescope/telescope-frecency.nvim', dependencies = 'kkharji/sqlite.lua' },
    -- 'nvim-telescope/telescope-project.nvim',
    -- 'nvim-telescope/telescope-dap.nvim',
    -- 'nvim-telescope/telescope-node-modules.nvim',
    -- 'nvim-telescope/telescope-z.nvim',
    -- 'nvim-telescope/telescope-ui-select.nvim',
    -- 'LinArcX/telescope-ports.nvim',
    -- 'nvim-telescope/telescope-symbols.nvim',
    -- 'LinArcX/telescope-scriptnames.nvim',
    -- 'LinArcX/telescope-changes.nvim',
    -- 'nat-418/telescope-color-names.nvim',
    -- 'olacin/telescope-cc.nvim',
    -- 'danielvolchek/tailiscope.nvim',
    -- { 'pwntester/octo.nvim', config = true },
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
          theme = 'dropdown',
        },
      },
    }
    require('telescope').load_extension 'fzf'
    require('telescope').load_extension 'file_browser'
    require('telescope').load_extension 'noice'
    require('telescope').load_extension 'neoclip'
    require('telescope').load_extension 'gitmoji'
    require('telescope').load_extension 'adjacent'
    require('telescope').load_extension 'projects'
    require('telescope').load_extension 'frecency'
    -- require('telescope').load_extension 'project'
    -- require('telescope').load_extension 'ui-select'
    -- require('telescope').load_extension 'ports'
    -- require('telescope').load_extension 'node_modules'
    -- require('telescope').load_extension 'z'
    -- require('telescope').load_extension 'scriptnames'
    -- require('telescope').load_extension 'changes'
    -- require('telescope').load_extension 'color_names'
    -- require('telescope').load_extension 'conventional_commits'
    -- require('telescope').load_extension 'tailiscope'

    local wk = require 'which-key'
    wk.register {

      ['<Leader>f'] = {
        name = 'Find',
        a = { '<Cmd>Telescope adjacent<CR>', 'Adjacent' },
        B = { '<Cmd>Telescope buffers<CR>', 'Buffers' },
        b = { '<Cmd>Telescope file_browser<CR>', 'Files with file browser' },
        c = { '<Cmd>Telescope colorscheme<CR>', 'Colorschemes' },
        d = { '<Cmd>Telescope diagnostics<CR>', 'Document diagnostics' },
        f = { '<Cmd>Telescope find_files<CR>', 'Files' },
        h = { '<Cmd>Telescope help_tags<CR>', 'Help' },
        k = { '<Cmd>Telescope keymaps<CR>', 'Keymaps' },
        p = { '<Cmd>Telescope projects<CR>', 'Projects' },
        r = { '<Cmd>Telescope frecency<CR>', 'Recent Files' },
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
