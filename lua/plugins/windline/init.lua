return {
  {
    'windwp/windline.nvim',
    config = function()
      local windline = require 'windline'
      local statuslines = require 'plugins/windline/statuslines'

      windline.setup {
        statuslines = { statuslines.default, statuslines.winbar },
      }
    end,
  },
}
