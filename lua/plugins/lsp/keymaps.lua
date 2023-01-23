local M = {}
M.on_attach = function(_, bufnr)
  local wk = require 'which-key'
  local lsp_format = require 'plugins.lsp.format'
  wk.register {
    ['<Leader>l'] = {
      name = 'LSP',
      a = { vim.lsp.buf.code_action, 'Code Action', buffer = bufnr },
      D = { vim.lsp.buf.type_definition, 'Type Definition', buffer = bufnr },
      f = { lsp_format.format, 'Format', buffer = bufnr },
      h = { vim.lsp.buf.hover, 'Hover', buffer = bufnr },
      j = { vim.diagnostic.goto_next, 'Next Diagnostic', buffer = bufnr },
      k = { vim.diagnostic.goto_prev, 'Previous Diagnostic', buffer = bufnr },
      l = { vim.lsp.codelens.run, 'CodeLens Action' },
      r = { vim.lsp.buf.rename, 'Rename', buffer = bufnr },
      s = { vim.lsp.buf.signature_help, 'Signature Help', buffer = bufnr },
      i = { '<Cmd>LspInfo<CR>', 'Lsp Info', buffer = bufnr },
    },
    ['g'] = {
      name = 'Goto',
      i = { vim.lsp.buf.implementation, 'Implementation', buffer = bufnr },
      D = { vim.lsp.buf.declaration, 'Declaration', buffer = bufnr },
      d = { vim.lsp.buf.definition, 'Definition', buffer = bufnr },
      r = { vim.lsp.buf.references, 'References', buffer = bufnr },
    },
  }
end
return M
