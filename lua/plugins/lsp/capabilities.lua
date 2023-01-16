local M = {}

function M.on_attach(client, buffer)
  client.server_capabilities.semanticTokensProvider = nil
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_augroup('lsp_document_highlight', { clear = true })
    vim.api.nvim_clear_autocmds { buffer = buffer, group = 'lsp_document_highlight' }
    vim.api.nvim_create_autocmd('CursorHold', {
      callback = vim.lsp.buf.document_highlight,
      buffer = buffer,
      group = 'lsp_document_highlight',
      desc = 'Document Highlight',
    })
    vim.api.nvim_create_autocmd('CursorMoved', {
      callback = vim.lsp.buf.clear_references,
      buffer = buffer,
      group = 'lsp_document_highlight',
      desc = 'Clear All the References',
    })
  end
end

return M