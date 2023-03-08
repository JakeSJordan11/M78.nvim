return {
  'nvim-lualine/lualine.nvim',
  enabled = false,
  event = 'BufRead',
  config = function()
    local lualine = require 'lualine'
    lualine.setup {}
  end,
}
