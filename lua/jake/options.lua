vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.opt.clipboard = 'unnamedplus'
vim.opt.updatetime = 1000
vim.opt.showmode = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.hlsearch = false
vim.opt.timeoutlen = 300
vim.opt.splitkeep = 'screen'
vim.opt.mouse = 'a'
vim.opt.syntax = 'on'
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5
vim.opt.linebreak = true
vim.opt.concealcursor = 'i'
vim.opt.wildmenu = false
vim.opt.foldmethod = 'indent'
vim.opt.foldnestmax = 3
vim.opt.foldenable = false
vim.opt.fillchars = 'eob: '
vim.opt.pumheight = 16
vim.opt.title = true
vim.opt.titlestring = '%t'
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

if vim.g.neovide then
  vim.opt.guifont = { 'OperatorMonoSSmLig Nf:h16' }
  vim.api.nvim_set_var('neovide_cursor_vfx_mode', 'pixiedust')
  vim.api.nvim_set_var('neovide_hide_mouse_when_typing', true)
  vim.api.nvim_set_var('neovide_refresh_rate', 60)
  vim.api.nvim_set_var('neovide_refresh_rate_idle', 5)
  -- vim.api.nvim_set_var('neovide_fullscreen', true)
  vim.api.nvim_set_var('neovide_input_macos_alt_is_meta', true)
end
