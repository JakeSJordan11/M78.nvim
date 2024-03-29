return {
  'rcarriga/nvim-notify',
  config = function()
    local notify = require 'notify'
    notify.setup {
      fps = 60,
      timeout = 1500,
      stages = 'slide',
      level = 'warn',
      max_height = function()
        return math.floor(vim.o.lines * 0.50)
      end,
      max_width = function()
        return math.floor(vim.o.columns * 0.45)
      end,
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { focusable = false })
      end,
    }
  end,
}
