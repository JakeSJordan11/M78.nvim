vim.cmd("highlight SignColumn guibg=NONE") -- background color of signcolumn bar not edits
vim.cmd("highlight CursorLine guibg=NONE") -- background of current cursor line
vim.cmd("highlight CursorLineNr guibg=NONE") -- background of number column on current cursor line

-- Git Signs remove background highlight in signcolumn
vim.cmd("highlight GitSignsAdd guibg=NONE")
vim.cmd("highlight GitSignsChange guibg=NONE")
vim.cmd("highlight GitSignsDelete guibg=NONE")
vim.cmd("highlight GitSignsChange guibg=NONE")

-- Diagnostics remove background highlight in signcolumn
vim.cmd("highlight DiagnosticSignError guibg=NONE")
vim.cmd("highlight DiagnosticSignWarn guibg=NONE")
vim.cmd("highlight DiagnosticSignInfo guibg=NONE")
vim.cmd("highlight DiagnosticSignHint guibg=NONE")

vim.cmd("highlight Pmenu ctermbg=NONE guibg=NONE")
