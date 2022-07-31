local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  window = {
    border = "rounded",
  },
}

local opts = {
  prefix = "<leader>",
}

local mappings = {
  ["/"] = { require("Comment.api").toggle_current_linewise, "Comment" },
  ["e"] = { "<cmd> Telescope file_browser<CR>", "File Explorer" },

  b = {
    name = "Buffer",
    c = { "<cmd>bdelete!<CR>", "Close Buffer" },
  },

  f = {
    name = "Find",
    d = { "<cmd>TroubleToggle<CR>", "QuickFix" },
    f = { require("telescope.builtin").find_files, "Find files" },
    p = { "<cmd>Telescope projects<cr>", "Projects" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    h = { require("telescope.builtin").help_tags, "Find Help" },
    m = { require("telescope.builtin").man_pages, "Man Pages" },
    k = { require("telescope.builtin").keymaps, "Keymaps" },
    C = { require("telescope.builtin").commands, "Commands" },
    g = { require("telescope.builtin").git_files, "Git Files" },
  },

  g = {
    name = "Git",
    b = { require("telescope.builtin").git_branches, "Branches" },
    c = { require("telescope.builtin").git_commits, "Commits" },
    d = { "<cmd> Gitsigns diffthis<CR>", "Diff" },
    g = { _LAZYGIT_TOGGLE, "Lazygit" },
    s = { require("telescope.builtin").git_status, "Status" },
  },

  h = {
    name = "Harpoon",
    f = { require("harpoon.mark").add_file, "Harpoon File" },
    d = { require("harpoon.ui").toggle_quick_menu, "Quick Menu" },
  },

  n = {
    name = "Navigation",
    e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  },

  p = {
    name = "Packer",
    s = { "<cmd>PackerSync<cr>", "Sync" },
  },
}
which_key.setup(setup)
which_key.register(mappings, opts)
