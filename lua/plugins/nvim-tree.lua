return {
  'nvim-tree/nvim-tree.lua',
  config = function()
    local nvimTree = require 'nvim-tree'
    nvimTree.setup {
      renderer = {
        root_folder_label = false,
      },
      -- view = {
      --   hide_root_folder = true,
      -- },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
      },
      update_focused_file = {
        enable = true,
        update_root = true,
      },
    }
  end,
}
