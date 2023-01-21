local M = {}
local state = WindLine.state
local colors = require 'plugins.windline.colors'
local basic = require 'windline.components.basic'

M.vi_mode = {
  name = 'vi_mode',
  hl_colors = colors.colors_mode,
  text = function()
    return { { ' ' .. state.mode[1] .. ' ', state.mode[2] } }
  end,
}
M.file_name = { basic.cache_file_name() }

M.file_type = { basic.cache_file_type { icon = true } }

M.file_icon = { basic.cache_file_icon() }

M.progress = { ' ' .. basic.progress }

M.line_col = { ' ' .. basic.line_col }

-- M.full_file_name = { ' ' .. basic.full_file_name }
-- M.divider = { basic.divider }

return M
