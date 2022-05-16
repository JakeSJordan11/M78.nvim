local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback
require("nvim-tree").setup({
  hijack_unnamed_buffer_when_opening = true,
  update_cwd = true,
  view = {
    hide_root_folder = true,
    mappings = {
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
        { key = "h", cb = tree_cb("close_node") },
        { key = "v", cb = tree_cb("vsplit") },
      },
    },
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "◉",
      info = "◉",
      warning = "◉",
      error = "◉",
    },
    show_on_dirs = true,
  },
  renderer = {
    indent_markers = {
      enable = true,
    },
  },
  filters = {
    dotfiles = true,
  },
})
