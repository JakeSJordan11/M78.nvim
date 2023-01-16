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
  extensions = {
    file_browser = {
      theme = "ivy",
    },
  },
}
telescope.load_extension "file_browser"
