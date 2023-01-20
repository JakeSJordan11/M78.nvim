local M = {}

function M.on_attach()
  local diagnostic_signs = { Error = '', Warn = '', Hint = '', Info = '', Other = '﫠' }
  for type, icon in pairs(diagnostic_signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
end

return M
