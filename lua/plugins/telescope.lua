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
    'nvim-telescope/telescope-project.nvim',
    {
      'ahmedkhalf/project.nvim',
      config = function()
        require('project_nvim').setup()
      end,
    },
    { 'nvim-telescope/telescope-frecency.nvim', dependencies = 'kkharji/sqlite.lua' },
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
    }
    require('telescope').load_extension 'fzf'
    require('telescope').load_extension 'file_browser'
    require('telescope').load_extension 'noice'
    require('telescope').load_extension 'neoclip'
    require('telescope').load_extension 'gitmoji'
    require('telescope').load_extension 'adjacent'
    require('telescope').load_extension 'projects'
    require('telescope').load_extension 'frecency'
    require('telescope').load_extension 'notify'
    require('telescope').load_extension 'project'
  end,
}
