require('telescope').setup {
  pickers = {
    colorscheme = {
      theme = 'dropdown',
    },
    commands = {
      theme = 'ivy',
    },
    keymaps = {
      theme = 'ivy',
    },
  },
  extensions = {
    file_browser = {
      theme = 'ivy',
    },
  },
}
require('telescope').load_extension 'file_browser'
require('telescope').load_extension 'projects'
