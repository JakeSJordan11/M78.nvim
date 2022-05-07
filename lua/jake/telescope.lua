local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.setup({
  defaults = {
  },
  pickers = {
    colorscheme = {
      theme = "dropdown",
    },
    find_files = {
      layout_config = {
        preview_width = 0.5,
      },
    },
    oldfiles = {
      layout_config = {
        preview_width = 0.5,
      },
    },
    diagnostics = {
      theme = "ivy",
    },
  },
  extensions = {
    file_browser = {
      theme = "ivy",
    },
  },
})
telescope.load_extension("fzf")
telescope.load_extension("file_browser")
telescope.load_extension("projects")
