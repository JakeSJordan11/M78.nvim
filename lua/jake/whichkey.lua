local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
    presets = {
      operators = true,
      motions = true,
      text_objects = true,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  operators = { gc = "Comments" },
  key_labels = {
    ["<leader>"] = "Leader",
  },
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },
  popup_mappings = {
    scroll_down = "<c-d>",
    scroll_up = "<c-u>",
  },
  window = {
    border = "rounded",
    position = "bottom",
    margin = { 1, 0, 1, 0 },
    padding = { 2, 2, 2, 2 },
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 3,
    align = "center",
  },
  ignore_missing = false,
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
  show_help = true,
  triggers = "auto",
  triggers_blacklist = {
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local function GitToggle()
  local git = require("gitsigns")
  git.toggle_signs()
  git.toggle_numhl()
  git.toggle_linehl()
end

local mappings = {
  ["/"] = { require("Comment.api").toggle_current_linewise, "Comment" },
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["q"] = { "<cmd>q!<CR>", "Quit" },
  ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  ["M"] = { "<cmd>MinimapToggle<cr>", "Toggle Minimap" },
  ["z"] = { "<cmd>ZenMode<cr>", "Toggle ZenMode" },

  b = {
    name = "Buffer",
    c = { "<cmd>bdelete!<CR>", "Close Buffer" },
  },

  f = {
    name = "Find",
    b = { require("telescope.builtin").buffers, "Find Buffers" },
    e = { "<cmd> Telescope file_browser<CR>", "File Explorer" },
    f = { require("telescope.builtin").find_files, "Find files" },
    p = { "<cmd>Telescope projects<cr>", "Projects" },
    t = { require("telescope.builtin").live_grep, "Find Text" },
    c = { "<cmd>Telescope themes<cr>", "Colorscheme" },
    h = { require("telescope.builtin").help_tags, "Find Help" },
    m = { require("telescope.builtin").man_pages, "Man Pages" },
    o = { require("telescope.builtin").oldfiles, "Old Files" },
    R = { require("telescope.builtin").registers, "Registers" },
    k = { require("telescope.builtin").keymaps, "Keymaps" },
    C = { require("telescope.builtin").commands, "Commands" },
    g = { require("telescope.builtin").git_files, "Git Files" },
    i = { require("telescope.builtin").current_buffer_fuzzy_find, "Search In File" },
    l = { require("telescope").extensions.frecency.frecency, "Frecency" },
  },

  g = {
    name = "Git",
    b = { require("telescope.builtin").git_branches, "Branches" },
    c = { require("telescope.builtin").git_commits, "Commits" },
    d = { require("gitsigns").diffthis, "Diff" },
    g = { _LAZYGIT_TOGGLE, "Lazygit" },
    s = { require("telescope.builtin").git_status, "Status" },
    t = { GitToggle, "Signs" },
  },

  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

  s = {
    name = "Spotify",
    u = { _SPOTIFY_TOGGLE, "Spotify" },
  },

  t = {
    name = "Terminal",
    n = { _NODE_TOGGLE, "Node" },
    u = { _NCDU_TOGGLE, "NCDU" },
    t = { _HTOP_TOGGLE, "Htop" },
    p = { _PYTHON_TOGGLE, "Python" },
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<CR>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<CR>", "Vertical" },
    w = { "<cmd>!rustywind % --write<CR><CR>", "Rustywind" },
  },

  w = {
    name = "Window",
    ["+"] = { "<cmd>wincmd +<cr>", "Increase height" },
    ["-"] = { "<cmd>wincmd -<cr>", "Decrease height" },
    ["="] = { "<cmd>wincmd =<cr>", "Equally high and wide" },
    [">"] = { "<cmd>wincmd ><cr>", "Increase width" },
    ["|"] = { "<cmd>wincmd |<cr>", "Max out the width" },
    ["<"] = { "<cmd>wincmd < <cr>", "Decrease width" },
    h = { "<cmd>wincmd h<CR>", "Go to the left window" },
    j = { "<cmd>wincmd j<CR>", "Go to the down window" },
    k = { "<cmd>wincmd k<CR>", "Go to the right window" },
    l = { "<cmd>wincmd l<CR>", "Go to the up window" },
    q = { "<cmd>wincmd q<CR>", "Quit a window" },
    s = { "<cmd>wincmd s<CR>", "Split Window" },
    v = { "<cmd>wincmd v<CR>", "Split Window Vertacally" },
    w = { "<cmd> wincmd w<CR>", "Switch Windows" },
    x = { "<cmd> wincmd x<CR>", "Swap current with next" },
  },
}
which_key.setup(setup)
which_key.register(mappings, opts)
