-- vim.opt.background = "dark"
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.tabstop = 2
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.complete:remove "i"
vim.opt.lazyredraw = true
vim.opt.display:append "lastline"
vim.opt.encoding = "utf-8"
vim.opt.linebreak = true
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5
vim.opt.syntax = "on"
vim.opt.wrap = false
vim.opt.laststatus = 3
vim.opt.wildmenu = true
vim.opt.tabpagemax = 50
-- vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.errorbells = false
vim.opt.visualbell = true
vim.opt.mouse = "a"
-- vim.opt.title = true
vim.opt.termguicolors = true
vim.opt.cmdheight = 1
vim.opt.confirm = false
vim.opt.foldmethod = "indent"
vim.opt.foldnestmax = 3
vim.opt.foldenable = false
vim.opt.autoread = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.backspace = "indent,eol,start"
vim.opt.formatoptions:append "j"
vim.opt.hidden = true
vim.opt.history = 1000
vim.opt.modeline = false
vim.opt.nrformats:remove "octal"
vim.opt.shell = "/bin/zsh"
vim.opt.spell = false
vim.opt.wildignore:append ".pyc,.swp"
vim.opt.guifont = "OperatorMonoSSmLig NF, DankMono NF, Hack NF, Cascadia Mono, *:h20"
vim.opt.clipboard = "unnamedplus"
vim.opt.concealcursor = "i"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.fillchars = "eob: "
vim.opt.highlight.blend = 100
vim.opt.undofile = true
vim.opt.showmode = false

vim.cmd [[
  augroup yank_highlight
    autocmd!
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'IncSearch', timeout = 200})
  augroup END
]]
