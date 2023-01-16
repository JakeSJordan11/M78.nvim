local status_ok, cmp = pcall(require, 'cmp')
if not status_ok then
  return
end
require('luasnip.loaders.from_vscode').lazy_load()
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'calc' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'omni' },
    { name = 'tmux' },
  }, {
    { name = 'buffer' },
  }),
}
