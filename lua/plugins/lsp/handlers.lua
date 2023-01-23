local M = {}

function M.on_attach()
  vim.diagnostic.config { float = { border = 'rounded' } }
  vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = false,
    virtual_text = false,
  })
end

return M
