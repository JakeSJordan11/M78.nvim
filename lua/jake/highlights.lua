vim.cmd([[
  augroup jake_highlights
    autocmd!
  autocmd ColorScheme * highlight Pmenu ctermbg=NONE guibg=NONE 
  \ | highlight SignColumn guibg=NONE 
  \ | highlight CursorLine guibg=NONE 
  \ | highlight CursorLineNr guibg=NONE 
  \ | highlight GitSignsAdd guibg=NONE 
  \ | highlight GitSignsChange guibg=NONE 
  \ | highlight GitSignsDelete guibg=NONE 
  \ | highlight DiagnosticSignError guibg=NONE
  \ | highlight DiagnosticSignWarn guibg=NONE
  \ | highlight DiagnosticSignInfo guibg=NONE
  \ | highlight DiagnosticSignHint guibg=NONE
  \ | highlight NormalFloat guibg=NONE
  augroup END
]])

vim.cmd([[
  augroup yank_highlight
    autocmd!
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'IncSearch', timeout = 200})
  augroup END
]])
