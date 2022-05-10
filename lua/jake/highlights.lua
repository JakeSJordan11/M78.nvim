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
  \ | highlight Pmenu ctermbg=NONE guibg=NONE
  augroup END
]])
