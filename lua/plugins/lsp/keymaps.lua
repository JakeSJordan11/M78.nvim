local M = {}
M.on_attach = function(_, bufnr)
  local wk = require 'which-key'
  wk.register {
    ['<Leader>l'] = {
      name = 'LSP',
      a = { vim.lsp.buf.code_action, 'Code Action', buffer = bufnr },
      D = { vim.lsp.buf.type_definition, 'Type Definition', buffer = bufnr },
      d = { '<Cmd>TroubleToggle<CR>', 'Toggle Trouble' },
      f = { require('plugins.lsp.format').format, 'Format', buffer = bufnr },
      h = { vim.lsp.buf.hover, 'Hover', buffer = bufnr },
      j = { vim.diagnostic.goto_next, 'Next Diagnostic', buffer = bufnr },
      k = { vim.diagnostic.goto_prev, 'Previous Diagnostic', buffer = bufnr },
      l = { vim.lsp.codelens.run, 'CodeLens Action' },
      r = { vim.lsp.buf.rename, 'Rename', buffer = bufnr },
      i = { '<Cmd>LspInfo<CR>', 'Lsp Info', buffer = bufnr },
      s = { vim.lsp.buf.signature_help, 'Signature Help', buffer = bufnr },
    },
    ['g'] = {
      name = 'Goto',
      i = { '<Cmd>lua vim.lsp.buf.implementation()<CR>', 'Implementation', buffer = bufnr },
      D = { '<Cmd>lua vim.lsp.buf.declaration()<CR>', 'Declaration', buffer = bufnr },
      d = { '<Cmd>lua vim.lsp.buf.definition()<CR>', 'Definition', buffer = bufnr },
      r = { '<Cmd>lua vim.lsp.buf.references()<CR>', 'References', buffer = bufnr },
    },
  }
end
return M
