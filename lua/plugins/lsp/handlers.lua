local M = {}

function M.on_attach()
  vim.diagnostic.config { virtual_text = false, float = { border = 'rounded' } }
  local diagnostic_signs = {
    Error = '',
    Warn = '',
    Hint = '',
    Info = '',
  }
  for type, icon in pairs(diagnostic_signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
end

return M
