return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-telescope/telescope-fzf-native.nvim',
  },
  cmd = 'Telescope',
  keys = {
    { '<leader><space>', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
    { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
    { '<leader>fr', '<cmd>Telescope oldfiles<cr>', desc = 'Recent' },
    { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Buffers' },
    { '<leader>fg', '<cmd>Telescope git_files<cr>', desc = 'Git Files' },
    { '<leader>f/', '<cmd>Telescope live_grep<cr>', desc = 'Grep' },
  },
  opts = function()
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
  end,
}
