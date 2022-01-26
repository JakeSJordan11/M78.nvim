-- Taken from the folowing site to start
-- https://www.shortcutfoo.com/blog/top-50-vim-configuration-options/

--------------------------------
-- Indention Options --
--------------------------------
vim.opt.autoindent = true -- New lines inherit the indentation of previous lines.
vim.opt.expandtab = true -- Convert tabs to spaces.
vim.opt.shiftround = true -- When shifting lines, round the indentation to the nearest multiple of “shiftwidth.”
vim.opt.shiftwidth = 2 -- When shifting, indent using two spaces.
vim.opt.smarttab = true -- Insert “tabstop” number of spaces when the “tab” key is pressed.
vim.opt.tabstop = 2 -- Indent using two spaces.

--------------------------------
-- Search Options --
--------------------------------
vim.opt.hlsearch = true -- Enable search highlighting.
vim.opt.ignorecase = true -- Ignore case when searching.
vim.opt.incsearch = true -- Incremental search that shows partial matches.
vim.opt.smartcase = true -- Automatically switch search to case-sensitive when search query contains an uppercase letter.

--------------------------------
-- Performance Options --
--------------------------------
vim.opt.complete:remove("i") -- Limit the files searched for auto-completes.
vim.opt.lazyredraw = true -- Don’t update screen during macro and script execution.

--------------------------------
-- Text Rendering Options --
--------------------------------
vim.opt.display:append("lastline") -- Always try to show a paragraph’s last line.
vim.opt.encoding = "utf-8" -- Use an encoding that supports unicode.
vim.opt.linebreak = true -- Avoid wrapping a line in the middle of a word.
vim.opt.scrolloff = 1 -- The number of screen lines to keep above and below the cursor.
vim.opt.sidescrolloff = 5 -- The number of screen columns to keep to the left and right of the cursor.
vim.opt.syntax = "on" -- Enable syntax highlighting.
vim.opt.wrap = true -- Enable line wrapping.

--------------------------------
-- User Interface Options --
--------------------------------
vim.opt.laststatus = 2 -- Always display the status bar.
vim.opt.ruler = true -- Always show cursor position.
vim.opt.wildmenu = true -- Display command line’s tab complete options as a menu.
vim.opt.tabpagemax = 50 -- Maximum number of tab pages that can be opened from the command line.
vim.opt.cursorline = true -- Highlight the line currently under cursor.
vim.opt.number = true -- Show line numbers on the sidebar.
vim.opt.relativenumber = true -- Show line number on the current line and relative numbers on all other lines.
vim.opt.errorbells = false -- Disable beep on errors.
vim.opt.visualbell = true -- Flash the screen instead of beeping on errors.
vim.opt.mouse = "a" -- Enable mouse for scrolling and resizing.
vim.opt.title = true -- Set the window’s title, reflecting the file currently being edited.
vim.opt.background = "dark" -- Use colors that suit a dark background.
vim.opt.termguicolors = true -- Allow fuller color syntax

--------------------------------
-- Code Folding Options --
--------------------------------
vim.opt.foldmethod = "indent" -- Fold based on indention levels.
vim.opt.foldnestmax = 3 -- Only fold up to three nested levels.
vim.opt.foldenable = false -- Disable folding by default.

--------------------------------
-- Miscellaneous Options --
--------------------------------
vim.opt.autoread = true -- Automatically re-read files if unmodified inside Vim.
vim.opt.backup = false -- creates a backup file
vim.opt.backspace = "indent,eol,start" -- Allow backspacing over indention, line breaks and insertion start.
-- vim.opt.backupdir = "~/.cache/vim"	        -- Directory to store backup files.
vim.opt.confirm = true -- Display a confirmation dialog when closing an unsaved file.
-- vim.opt.dir = "~/.cache/vim"		            -- Directory to store swap files.
vim.opt.formatoptions:append("j") -- Delete comment characters when joining lines.
vim.opt.hidden = true -- Hide files in the background instead of closing them.
vim.opt.history = 1000 -- Increase the undo limit.
vim.opt.modeline = false -- Ignore file’s mode lines; use vimrc configurations instead.
vim.opt.swapfile = false -- Enable swap files.
vim.opt.nrformats:remove("octal") -- Interpret octal as decimal when incrementing numbers.
vim.opt.shell = "/bin/zsh" -- The shell used to execute commands.
vim.opt.spell = false -- Enable spellchecking.
vim.opt.wildignore:append(".pyc,.swp") -- Ignore files matching these patterns when opening files based on a glob pattern.
vim.opt.guifont = "OperatorMonoSSmLig NF, DankMono NF, Hack NF, Cascadia Mono, *:h18" -- Set font when using GUI app.
vim.opt.clipboard = "unnamedplus" -- Share system clipboard on yank.
vim.opt.concealcursor = "i" -- Hide cursor when entering insert mode
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
