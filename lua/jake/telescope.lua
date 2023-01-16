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
    },
  },
}
pcall(require('telescope').load_extension, 'fzf')
require('telescope').load_extension 'projects'
require('telescope').load_extension 'ui-select'
require('telescope').load_extension 'file_browser'
