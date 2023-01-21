local M = {}
M.hl_list = {
  Black = { 'white', 'black' },
  White = { 'black', 'white' },
  Normal = { 'NormalFg', 'NormalBg' },
  Inactive = { 'InactiveFg', 'InactiveBg' },
  Active = { 'ActiveFg', 'ActiveBg' },
}

M.colors_mode = {
  Normal = { 'black', 'magenta' },
  Insert = { 'black', 'green' },
  Visual = { 'black', 'yellow' },
  Replace = { 'black', 'blue_light' },
  Command = { 'black', 'red' },
}
return M
