local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup {
  spec = {
    import = 'plugins',
  },
  install = {
    colorscheme = { 'gruvbox' },
  },
  ui = {
    border = 'rounded',
  },
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'matchit',
        -- 'matchparen',
        'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zip Plugin',
      },
    },
  },
}

local wk = require 'which-key'
wk.register {
  ['<Leader>n'] = {
    z = { '<Cmd>Lazy<CR>', 'Lazy' },
  },
}
