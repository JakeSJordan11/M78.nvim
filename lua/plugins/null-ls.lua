return {
  {
    'jose-elias-alvarez/null-ls.nvim',
    event = 'BufReadPre',
    config = function()
      local nls = require 'null-ls'
      nls.setup {
        sources = {
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.prettierd,
        },
      }
    end,
  },
}
