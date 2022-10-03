local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.setup {
  defaults = {
    layout_config = {
      prompt_position = "top",
    },
    sorting_strategy = "ascending",
  },
  pickers = {
    colorscheme = {
      theme = "dropdown",
    },
  },
  extensions = {
    file_browser = {
      previewer = false,
    },
  },
}
pcall(require('telescope').load_extension, 'fzf')
telescope.load_extension "file_browser"
telescope.load_extension "projects"
telescope.load_extension "ui-select"
