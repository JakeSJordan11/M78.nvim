return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-telescope/telescope-fzf-native.nvim',
    'ahmedkhalf/project.nvim',
    'nvim-telescope/telescope-dap.nvim',
    'LinArcX/telescope-ports.nvim',
  },
  lazy = false,
  cmd = 'Telescope',
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
    pcall(require('telescope').load_extension, 'fzf')
    require('telescope').load_extension 'projects'
    require('telescope').load_extension 'ui-select'
    require('telescope').load_extension 'file_browser'
    require('telescope').load_extension 'ports'
  end,
}
