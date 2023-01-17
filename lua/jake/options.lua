vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.signcolumn = 'yes' -- Show sign column always
vim.opt.clipboard = 'unnamedplus' -- Copy to system clipboard
vim.opt.timeoutlen = 300 -- Time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.fillchars = { eob = ' ' } -- Hide ~ at the end of buffer

-- neovide
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
