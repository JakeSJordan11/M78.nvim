vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.opt.clipboard = 'unnamedplus'
vim.opt.updatetime = 1000
vim.opt.fillchars = { eob = ' ' }
vim.opt.showmode = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.completeopt = 'menuone,noselect'
vim.opt.autoindent = true
vim.opt.cindent = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.belloff = 'all'
vim.opt.hidden = true
vim.opt.joinspaces = false
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.hlsearch = false
vim.opt.timeout = true
vim.opt.timeoutlen = 300
vim.opt.laststatus = 3
vim.opt.splitkeep = 'screen'
vim.opt.pumheight = 10

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

if vim.g.neovide then
  vim.opt.guifont = 'OperatorMonoSSmLig NF:h16'
  vim.api.nvim_set_var('neovide_cursor_vfx_mode', 'torpedo')
  vim.api.nvim_set_var('neovide_cursor_vfx_particle_lifetime', 1.2)
  vim.api.nvim_set_var('neovide_cursor_vfx_particle_density', 7.0)
  vim.api.nvim_set_var('neovide_cursor_vfx_particle_speed', 10.0)
  vim.api.nvim_set_var('neovide_input_use_logo', true)
  vim.api.nvim_set_var('neovide_macos_alt_is_meta', false)
  vim.api.nvim_set_var('neovide_hide_mouse_when_typing', true)
end
