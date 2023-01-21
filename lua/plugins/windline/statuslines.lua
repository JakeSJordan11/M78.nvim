local M = {}
local components = require 'plugins/windline/components'

M.default = {
  filetypes = { 'default' },
  active = {
    components.vi_mode,
    components.file_name,
    components.file_type,
    components.progress,
    components.line_col,
    components.file_icon,
  },
  inactive = {},
}

M.winbar = {
  filetypes = { 'winbar' },
  active = {
    components.vi_mode,
    components.file_name,
    components.file_type,
    components.progress,
    components.line_col,
    components.file_icon,
  },
  always_active = true,
}
return M
