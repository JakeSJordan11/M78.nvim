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
  j = {
    f = { require("harpoon.ui").toggle_quick_menu, "Quick Menu" },
    j = { require("harpoon.mark").add_file, "Harpoon File" },
  },

  f = {
    f = { _LAZYGIT_TOGGLE, "Lazygit" },
    j = { "<cmd>TroubleToggle<CR>", "QuickFix" },
    k = { require("telescope.builtin").git_files, "Git Files" },
    l = { "<cmd> Telescope file_browser<CR>", "File Explorer" },
    [";"] = { "<cmd>bdelete!<CR>", "Close Buffer" },
  },
}
which_key.setup(setup)
which_key.register(mappings, opts)
