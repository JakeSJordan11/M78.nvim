-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Better viewing
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', 'g,', 'g,zvzz')
vim.keymap.set('n', 'g;', 'g;zvzz')

-- Better indent
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Paste over currently selected text without yanking it
vim.keymap.set('v', 'p', '"_dP')

-- Move Lines
vim.keymap.set('n', '<A-j>', '<Cmd>m .+1<CR>==')
vim.keymap.set('v', '<A-j>', "<Cmd>m '>+1<CR>gv=gv")
vim.keymap.set('i', '<A-j>', '<Esc><Cmd>m .+1<CR>==gi')
vim.keymap.set('n', '<A-k>', '<Cmd>m .-2<CR>==')
vim.keymap.set('v', '<A-k>', "<Cmd>m '<-2<CR>gv=gv")
vim.keymap.set('i', '<A-k>', '<Esc><Cmd>m .-2<CR>==gi')

-- Resize window using <shift> arrow keys
vim.keymap.set('n', '<S-Up>', '<Cmd>resize +2<CR>')
vim.keymap.set('n', '<S-Down>', '<Cmd>resize -2<CR>')
vim.keymap.set('n', '<S-Left>', '<Cmd>vertical resize -2<CR>')
vim.keymap.set('n', '<S-Right>', '<Cmd>vertical resize +2<CR>')

-- Resize window using <Cmmand + Shift> hjkl
vim.keymap.set('n', '<DS-k>', '<Cmd>resize +2<CR>')
vim.keymap.set('n', '<DS-j>', '<Cmd>resize -2<CR>')
vim.keymap.set('n', '<DS-h>', '<Cmd>vertical resize -2<CR>')
vim.keymap.set('n', '<DS-l>', '<Cmd>vertical resize +2<CR>')

-- Command s save
vim.keymap.set('n', '<D-s>', '<Cmd>w!<CR>')

-- switch buffers
vim.keymap.set('n', '<S-l>', '<Cmd>bnext<CR>', { silent = true })
vim.keymap.set('n', '<S-h>', '<Cmd>bprevious<CR>', { silent = true })
