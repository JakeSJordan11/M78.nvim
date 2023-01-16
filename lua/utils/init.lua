local M = {}
function _G.set_terminal_keymaps() end

vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'
local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new { cmd = 'lazygit', hidden = true }
function M.Lazygit()
  return lazygit:toggle()
end

return M
