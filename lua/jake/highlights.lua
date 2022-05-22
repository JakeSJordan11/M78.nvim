vim.cmd([[
  augroup yank_highlight
    autocmd!
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'IncSearch', timeout = 200})
  augroup END
]])

vim.api.nvim_set_hl(0, 'CursorLine', {})
vim.api.nvim_set_hl(0, 'CursorLineNr', {})
vim.api.nvim_set_hl(0, 'DiagnosticSignError', { fg = '#fb4934' })
vim.api.nvim_set_hl(0, 'DiagnosticSignWarn', { fg = '#fabd2f' })
vim.api.nvim_set_hl(0, 'DiagnosticSignHint', { fg = '#8ec07c' })
vim.api.nvim_set_hl(0, 'DiagnosticSignInfo', { fg = '#83a598' })
vim.api.nvim_set_hl(0, 'GitSignsAdd', {})
vim.api.nvim_set_hl(0, 'GitSignsChange', {})
vim.api.nvim_set_hl(0, 'GitSignsDelete', {})
vim.api.nvim_set_hl(0, 'NormalFloat', {})
vim.api.nvim_set_hl(0, 'Pmenu', {})
vim.api.nvim_set_hl(0, 'SignColumn', {})
vim.api.nvim_set_hl(0, 'WildMenu', {})
