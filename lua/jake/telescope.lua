local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.setup {
  defaults = {
    layout_config = {
      preview_width = 0.6,
    },
    mappings = {
      i = {
        ["<C-h>"] = "which_key",
      },
    },
  },
  pickers = {
    colorscheme = {
      theme = "dropdown",
    },
    commands = {
      theme = "ivy",
    },
    keymaps = {
      theme = "ivy",
    },
  },
  extensions = {},
}
telescope.load_extension "fzf"
telescope.load_extension "file_browser"
telescope.load_extension "projects"
telescope.load_extension "ui-select"
telescope.load_extension "toggleterm"
--telescope.load_extension("themes")

require("telescope-toggleterm").setup {
  telescope_mappings = {
    -- <ctrl-c> : kill the terminal buffer (default) .
    ["<C-c>"] = require("telescope-toggleterm").actions.exit_terminal,
  },
}
