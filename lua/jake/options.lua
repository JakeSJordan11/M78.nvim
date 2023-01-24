vim.opt.highlight.blend = 100 
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.opt.clipboard = 'unnamedplus'
vim.opt.updatetime = 1000
vim.opt.showmode = false
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.autoindent = true
vim.opt.cindent = true
vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.joinspaces = false
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.hlsearch = false
vim.opt.timeout = true
vim.opt.timeoutlen = 300
vim.opt.laststatus = 3
vim.opt.splitkeep = 'screen'
vim.opt.formatoptions:append 'j'
vim.opt.autoread = true
vim.opt.mouse = 'a'
vim.opt.syntax = 'on'
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5
vim.opt.linebreak = true
vim.opt.display:append 'lastline'
vim.opt.complete:remove 'i'
vim.opt.shell = '/bin/zsh'
vim.opt.concealcursor = 'i'
vim.opt.errorbells = false
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.tabstop = 2
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.wildmenu = true
vim.opt.wildignore:append '.pyc,.swp'
vim.opt.visualbell = true
vim.opt.title = true
vim.opt.confirm = false
vim.opt.foldmethod = 'indent'
vim.opt.foldnestmax = 3
vim.opt.foldenable = false
vim.opt.backup = false
vim.opt.backspace = 'indent,eol,start'
vim.opt.nrformats:remove 'octal'
vim.opt.history = 1000
vim.opt.modeline = false
vim.opt.spell = false
vim.opt.fillchars = 'eob: '

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

if vim.g.neovide then
  vim.opt.guifont = 'OperatorMonoSSmLig Nf:h20'
  vim.api.nvim_set_var('neovide_cursor_vfx_mode', 'torpedo')
  vim.api.nvim_set_var('neovide_cursor_vfx_particle_lifetime', 1.2)
  vim.api.nvim_set_var('neovide_cursor_vfx_particle_density', 7.0)
  vim.api.nvim_set_var('neovide_cursor_vfx_particle_speed', 10.0)
  vim.api.nvim_set_var('neovide_input_use_logo', true)
  vim.api.nvim_set_var('neovide_macos_alt_is_meta', false)
  vim.api.nvim_set_var('neovide_hide_mouse_when_typing', true)
end
