local M = {}

local servers = {
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
        hint = { enable = false },
      },
    },
  },
  cssmodules_ls = {},
  cssls = {},
}

local function lsp_attach(on_attach)
  vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
      local bufnr = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      on_attach(client, bufnr)
    end,
  })
end

function M.setup(_)
  lsp_attach(function(client, buffer)
    require('plugins.lsp.format').on_attach(client, buffer)
    require('plugins.lsp.capabilities').on_attach(client, buffer)
    require('plugins.lsp.handlers').on_attach()
  end)

  require('mason-lspconfig').setup { ensure_installed = vim.tbl_keys(servers) }
  require('mason-lspconfig').setup_handlers {
    function(server)
      local opts = servers[server] or {}
      opts.capabilities = require('plugins.lsp.capabilities').lsp_capabilities()
      require('lspconfig')[server].setup(opts)
    end,
  }
  --[[ require('typescript').setup {
    root_dir = require('lspconfig').util.root_pattern 'package.json',
  } ]]
end

return M
