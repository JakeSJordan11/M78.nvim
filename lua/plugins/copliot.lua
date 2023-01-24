return {
  {
    'zbirenbaum/copilot.lua',
    dependencies = {
      {
        'zbirenbaum/copilot-cmp',
        config = function()
          require('copilot_cmp').setup {
            method = 'getPanelCompletions',
            formatters = {
              insert_text = require('copilot_cmp.format').remove_existing,
            },
          }
        end,
      },
    },
    cmd = 'Copilot',
    event = 'VimEnter',
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },
}
