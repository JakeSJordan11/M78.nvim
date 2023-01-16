local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local handlers = {
  ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' }),
  ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' }),
  ['textDocument/publishDiagnostics'] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    { virtual_text = false }
  ),
}

local signs = { Error = '◉', Warn = '◉', Hint = '◉', Info = '◉' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local opts = { noremap = true, silent = true }

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format {
    filter = function(clients)
      -- filter out clients that you don't want to use
      return vim.tbl_filter(function(client)
        return client
      end, clients)
    end,
    bufnr = bufnr,
  }
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

local on_attach = function(client, bufnr)
  client.server_capabilities.semanticTokensProvider = nil
  if client.supports_method 'textDocument/formatting' then
    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end

  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lf', '<cmd>lua vim.lsp.buf.format {bufnr=bufnr}<CR>', opts)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
end

require('nvim-lsp-installer').setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = handlers,
}
local servers = {
  'bashls',
  'pylsp',
  'cssls',
  'cssmodules_ls',
  -- "emmet_ls",
  'eslint',
  'gopls',
  'graphql',
  'html',
  'jsonls',
  'prismals',
  'stylelint_lsp',
  -- "sumneko_lua",
  'tailwindcss',
  'tsserver',
  -- "rust_analyzer",
}
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    handlers = handlers,
    flags = {},
  }
end

require('lspconfig').sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = handlers,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
}

require('lspconfig').emmet_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = handlers,
  filetypes = { 'html', 'javascriptreact', 'typescriptreact' },
}

require('null-ls').setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = handlers,
  sources = {
    -- require('null-ls').builtins.formatting.eslint_d,
    -- require('null-ls').builtins.formatting.stylua,
    -- require('null-ls').builtins.formatting.prettierd,
    -- require("null-ls").builtins.formatting.prismaFmt,
    -- require('null-ls').builtins.formatting.stylelint,
    -- require('null-ls').builtins.formatting.rustywind,
    -- require('null-ls').builtins.formatting.rustfmt,
    -- require("null-ls").builtins.formatting.stylelint_lsp,
  },
}

require('lspconfig').rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = handlers,
  settings = {
    ['rust-analyzer'] = {
      assist = {
        importGranularity = 'module',
        importPrefix = 'by_self',
      },
      cargo = {
        loadOutDirsFromCheck = true,
      },
      procMacro = {
        enable = true,
      },
    },
  },
}

require('rust-tools').setup {}
