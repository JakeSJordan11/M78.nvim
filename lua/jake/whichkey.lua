local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    ["<leader>"] = "Leader",
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  --[[ window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  }, ]]
  window = {
    border = "single", -- none, single, double, shadow
    position = "top", -- bottom, top
    margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "center", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings =
{
  ["/"] = { require("Comment.api").toggle_current_linewise, "Comment" },
  -- ["A"] = { "<cmd>Alpha<cr>", "Alpha" },
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["q"] = { "<cmd>q!<CR>", "Quit" },
  ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  ["M"] = { "<cmd>MinimapToggle<cr>", "Toggle Minimap" },

  b = {
    name = "Buffer",
    c = { "<cmd>bdelete!<CR>", "Close Buffer" },
    b = { require("telescope.builtin").buffers, "Buffers" },
  },

  f = {
    name = "Find",
    f = { require('telescope.builtin').find_files, "Find files" },
    p = { "<cmd>Telescope projects<cr>", "Projects" },
    t = { require('telescope.builtin').live_grep, "Find Text" },
    b = { "<cmd> Telescope file_browser<CR>", "File Browser" },
    c = { require('telescope.builtin').colorscheme, "Colorscheme" },
    h = { require('telescope.builtin').help_tags, "Find Help" },
    m = { require('telescope.builtin').man_pages, "Man Pages" },
    r = { require('telescope.builtin').oldfiles, "Old Files" },
    R = { require('telescope.builtin').registers, "Registers" },
    k = { require('telescope.builtin').keymaps, "Keymaps" },
    C = { require('telescope.builtin').commands, "Commands" },
  },

  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

  g = {
    name = "Git",
    b = { require('telescope.builtin').git_branches, "Branches" },
    c = { require('telescope.builtin').git_commits, "Commits" },
    f = { require('telescope.builtin').git_files, "Files" },
    g = { _LAZYGIT_TOGGLE, "Lazygit" },
    s = { require('telescope.builtin').git_status, "Status" },
  },

  l = {
    name = "LSP",
    a = { vim.lsp.buf.code_action, "Code Action" },
    f = { vim.lsp.buf.formatting, "Format" },
    i = { "<cmd>LspInfo<CR>", "Info" },
    j = { vim.diagnostic.goto_next, "Next Diagnostic" },
    k = { vim.diagnostic.goto_prev, "Prev Diagnostic" },
    l = { vim.lsp.codelens.run, "CodeLens Action" },
    q = { vim.lsp.diagnostic.set_loclist, "Quickfix" },
    r = { vim.lsp.buf.rename, "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
  },
  w = {

    name = "Window",
    ["+"] = { "<cmd>wincmd +<cr>", "Increase height" },
    ["-"] = { "<cmd>wincmd -<cr>", "Decrease height" },
    ["="] = { "<cmd>wincmd =<cr>", "Equally high and wide" },
    [">"] = { "<cmd>wincmd ><cr>", "Increase width" },
    ["|"] = { "<cmd>wincmd |<cr>", "Max out the width" },
    ["<"] = { "<cmd>wincmd < <cr>", "Decrease width" },
    h = { "<cmd>wincmd h<cr>", "Go to the left window" },
    j = { "<cmd>wincmd j<cr>", "Go to the down window" },
    k = { "<cmd>wincmd k<cr>", "Go to the right window" },
    l = { "<cmd>wincmd l<cr>", "Go to the up window" },
    q = { "<cmd>wincmd q<cr>", "Quit a window" },
    s = { "<cmd>wincmd s<cr>", "Split Window" },
    v = { "<cmd>wincmd v<cr>", "Split Window Vertacally" },
    w = { "<cmd> wincmd w<cr>", "Switch Windows" },
    x = { "<cmd> wincmd x<cr>", "Swap current with next" },
  },

  t = {
    name = "Terminal",
    n = { _NODE_TOGGLE, "Node" },
    u = { _NCDU_TOGGLE, "NCDU" },
    t = { _HTOP_TOGGLE, "Htop" },
    p = { _PYTHON_TOGGLE, "Python" },
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  },
}
which_key.setup(setup)
which_key.register(mappings, opts)
